import * as anchor from "@coral-xyz/anchor";
import { Connection, Keypair } from "@solana/web3.js";

import { IDL} from "./rarible_editions";
import { PROGRAM_ID_EDITIONS } from "./constants";
import { RaribleEditions } from "./rarible_editions";
import { PrivateKeyWallet } from "../../anchor/PrivateKeyWallet";

type ArrayElement<ArrayType extends readonly unknown[]> =
  ArrayType extends readonly (infer ElementType)[] ? ElementType : never;

export function getProgramInstanceEditions(
  connection: Connection,
) {
  
  const provider = new anchor.AnchorProvider(
    connection,
    new PrivateKeyWallet(Keypair.generate()),
    anchor.AnchorProvider.defaultOptions()
  );
  const idl = IDL;
  const program = new anchor.Program<RaribleEditions>(
    idl,
    provider
  )!;
  return program;
}
