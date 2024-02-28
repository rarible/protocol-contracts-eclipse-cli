import {
  Connection,
  Keypair,
  SystemProgram,
  Transaction,
  TransactionInstruction,
  PublicKey,
  ComputeBudgetProgram,
} from "@solana/web3.js";
import BN from "bn.js";

import {
  TOKEN_2022_PROGRAM_ID,
  getAssociatedTokenAddressSync,
} from "spl-token-4";
import { getProgramInstanceEditions } from "../../anchor/editions/getProgramInstanceEditions";
import { getEditionsPda } from "../../anchor/editions/pdas/getEditionsPda";
import { IExecutorParams } from "../../cli/IExecutorParams";
import { sendSignedTransaction } from "../tx_utils";
import { getHashlistPda } from "../../anchor/editions/pdas/getHashlistPda";
import { getProgramInstanceEditionsControls } from "anchor/controls/getProgramInstanceEditionsControls";
import { getEditionsControlsPda } from "anchor/controls/pdas/getEditionsControlsPda";
import { getHashlistMarkerPda } from "anchor/editions/pdas/getHashlistMarkerPda";
import { decodeEditions } from "anchor/editions/accounts";
import { getMinterStatsPda } from "anchor/controls/pdas/getMinterStatsPda";
import { getMinterStatsPhasePda } from "anchor/controls/pdas/getMinterStatsPhasePda";
import { decodeEditionsControls } from "anchor/controls/accounts";

export interface IMintWithControls {
  phaseIndex: number;
  editionsId: string;
}

export const mintWithControls = async ({
  wallet,
  params,
  connection,
}: IExecutorParams<IMintWithControls>) => {
  const { phaseIndex, editionsId } = params;

  const editionsControlsProgram =
    getProgramInstanceEditionsControls(connection);

  const editions = new PublicKey(editionsId);

  const editionsData = await connection.getAccountInfo(editions);

  if (!editionsData) {
    throw Error("Editions not found");
  }

  const libreplexEditionsProgram = getProgramInstanceEditions(connection);

  const editionsObj = decodeEditions(libreplexEditionsProgram)(
    editionsData.data,
    editions
  );

  const editionsControlsPda = getEditionsControlsPda(editions);

  const editionsControlsData = await connection.getAccountInfo(
    editionsControlsPda
  );

  const editionsControlsObj = decodeEditionsControls(editionsControlsProgram)(
    editionsControlsData.data,
    editionsControlsPda
  );

  const hashlist = getHashlistPda(editions)[0];

  const minterStats = getMinterStatsPda(editions, wallet.publicKey)[0];

  const minterStatsPhase = getMinterStatsPhasePda(
    editions, 
    wallet.publicKey,
    phaseIndex
  )[0];

  const mint = Keypair.generate();

  const tokenAccount = getAssociatedTokenAddressSync(
    mint.publicKey,
    wallet.publicKey,
    false,
    TOKEN_2022_PROGRAM_ID
  );

  const hashlistMarker = getHashlistMarkerPda(editions, mint.publicKey)[0];
  const instructions: TransactionInstruction[] = [];
  /// creates an open editions launch

  instructions.push(
    ComputeBudgetProgram.setComputeUnitLimit({
      units: 850_000,
    })
  );

  instructions.push(
    await editionsControlsProgram.methods
      .mintWithControls({
        phaseIndex,
      })
      .accounts({
        editionsDeployment: editions,
        editionsControls: editionsControlsPda,
        hashlist,
        hashlistMarker,
        payer: wallet.publicKey,
        mint: mint.publicKey,
        signer: wallet.publicKey,
        minter: wallet.publicKey,
        minterStats,
        minterStatsPhase,
        groupMint: editionsObj.item.groupMint,
        tokenAccount,
        treasury: editionsControlsObj.item.treasury,
        systemProgram: SystemProgram.programId,
        tokenProgram: TOKEN_2022_PROGRAM_ID,
        libreplexEditionsProgram: libreplexEditionsProgram.programId,
      })
      .signers([mint])
      .instruction()
  );

  // transaction boilerplate - ignore for now
  const tx = new Transaction().add(...instructions);
  tx.recentBlockhash = (await connection.getLatestBlockhash()).blockhash;
  tx.feePayer = wallet.publicKey;
  tx.sign(mint);
  await wallet.signTransaction(tx);

  const txid = await sendSignedTransaction({
    signedTransaction: tx,
    connection,
    skipPreflight: false,
  });

  return { editions, editionsControls: editionsControlsPda };
};
