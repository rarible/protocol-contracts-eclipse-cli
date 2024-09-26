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

import { TOKEN_2022_PROGRAM_ID } from "spl-token-4";
import { getProgramInstanceEditions } from "../../anchor/editions/getProgramInstanceEditions";
import { getEditionsPda } from "../../anchor/editions/pdas/getEditionsPda";
import { IExecutorParams } from "../../cli/IExecutorParams";
import { sendSignedTransaction } from "../tx_utils";
import { getHashlistPda } from "../../anchor/editions/pdas/getHashlistPda";
import { getProgramInstanceEditionsControls } from "anchor/controls/getProgramInstanceEditionsControls";
import { getEditionsControlsPda } from "anchor/controls/pdas/getEditionsControlsPda";
import { PROGRAM_ID_GROUP_EXTENSIONS } from "sdk/editions/createDeployment";

export interface CreatorWithShare {
  address: PublicKey;
  share: number;
}

export interface MetadataField {
  field: string;
  value: string;
}

export interface UpdateRoyaltiesArgs {
  royaltyBasisPoints: number; // Note the camelCase field name
  creators: CreatorWithShare[];
}

export interface IInitializeLaunch {
  symbol: string;
  jsonUrl: string;
  treasury: string;
  name: string;
  maxMintsPerWallet: number; // set to 0 for unlimited
  maxNumberOfTokens: number; // set to 0 for unlimited
  royalties: UpdateRoyaltiesArgs; // royalties info (basis points and creators)
  extraMeta: MetadataField[]; // array of extra metadata fields
  itemBaseUri: string; // URI for item base metadata
  itemName: string; // Name for each item
  cosignerProgramId?: PublicKey | null; // Optional cosigner program
}

export const createDeployment = async ({
  wallet,
  params,
  connection,
}: IExecutorParams<IInitializeLaunch>) => {
  const {
    symbol,
    jsonUrl,
    treasury,
    maxMintsPerWallet,
    maxNumberOfTokens,
    name,
    royalties,
    extraMeta,
    itemBaseUri,
    itemName,
    cosignerProgramId,
  } = params;

  const editionsControlsProgram = getProgramInstanceEditionsControls(connection);

  const editions = getEditionsPda(symbol);
  const editionsControls = getEditionsControlsPda(editions);

  const groupMint = Keypair.generate();
  const group = Keypair.generate();
  console.log({ groupMint: groupMint.publicKey.toBase58() });

  const hashlist = getHashlistPda(editions)[0];

  const libreplexEditionsProgram = getProgramInstanceEditions(connection);
  const instructions: TransactionInstruction[] = [];

  // Ensure creators' addresses are PublicKey instances
  const creatorsWithPublicKeys = royalties.creators.map((creator) => ({
    address: new PublicKey(creator.address),
    share: creator.share,
  }));

  // Prepare the royalties object with camelCase field names
  const royaltiesArgs = {
    royaltyBasisPoints: royalties.royaltyBasisPoints,
    creators: creatorsWithPublicKeys,
  };

  // Creates an open editions launch with extra metadata and royalties
  instructions.push(
    await editionsControlsProgram.methods
      .initialiseEditionsControls({
        maxMintsPerWallet: new BN(maxMintsPerWallet),
        treasury: new PublicKey(treasury),
        maxNumberOfTokens: new BN(maxNumberOfTokens),
        symbol,
        name,
        offchainUrl: jsonUrl,
        cosignerProgramId: cosignerProgramId ?? null,
        royalties: royaltiesArgs,
        extraMeta,
        itemBaseUri,
        itemName,
      })
      .accountsStrict({
        editionsControls,
        editionsDeployment: editions,
        hashlist,
        payer: wallet.publicKey,
        creator: wallet.publicKey,
        groupMint: groupMint.publicKey,
        group: group.publicKey,
        systemProgram: SystemProgram.programId,
        tokenProgram: TOKEN_2022_PROGRAM_ID,
        libreplexEditionsProgram: libreplexEditionsProgram.programId,
        groupExtensionProgram: PROGRAM_ID_GROUP_EXTENSIONS,
      })
      .signers([groupMint, group])
      .instruction()
  );

  // Modify compute units for the transaction
  const modifyComputeUnits = ComputeBudgetProgram.setComputeUnitLimit({
    units: 800000,
  });

  // Transaction setup
  const tx = new Transaction().add(modifyComputeUnits).add(...instructions);
  tx.recentBlockhash = (await connection.getLatestBlockhash()).blockhash;
  tx.feePayer = wallet.publicKey;
  tx.sign(groupMint, group);
  await wallet.signTransaction(tx);

  // Send transaction
  const txid = await sendSignedTransaction({
    signedTransaction: tx,
    connection,
    skipPreflight: false,
  });

  return { editions, editionsControls };
};
