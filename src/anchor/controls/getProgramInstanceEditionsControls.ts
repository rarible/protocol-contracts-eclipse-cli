import * as anchor from "@coral-xyz/anchor";
import { Connection, Keypair } from "@solana/web3.js";
import { IDL } from "./rarible_editions_controls";
import { RaribleEditionsControls } from "./rarible_editions_controls";
import { PrivateKeyWallet } from "../PrivateKeyWallet";

type ArrayElement<ArrayType extends readonly unknown[]> =
  ArrayType extends readonly (infer ElementType)[] ? ElementType : never;

export function getProgramInstanceEditionsControls(
  connection: Connection,
) {
  const provider = new anchor.AnchorProvider(
    connection,
    new PrivateKeyWallet(Keypair.generate()),
    anchor.AnchorProvider.defaultOptions()
  );
  const idl = IDL;
  const program = new anchor.Program<RaribleEditionsControls>(
    idl,
    provider
  )!;
  
  return program;
}
