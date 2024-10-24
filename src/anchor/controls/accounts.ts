
import { IdlAccounts, IdlTypes } from "@coral-xyz/anchor";
import { BorshCoder, Program } from "@coral-xyz/anchor";
import { Connection, PublicKey } from "@solana/web3.js";


import { RaribleEditionsControls } from "./rarible_editions_controls";

export type EditionsControls = IdlAccounts<RaribleEditionsControls>["editionsControls"];

export const getBase64FromDatabytes = (dataBytes: Buffer, dataType: string) => {
  const base = dataBytes.toString("base64");
  return `data:${dataType};base64,${base}`;
};

export const decodeEditionsControls =
  (program: Program<RaribleEditionsControls>) =>
  (buffer: Buffer | undefined, pubkey: PublicKey) => {
    const coder = new BorshCoder(program.idl);
    const liquidity = buffer
      ? coder.accounts.decode<EditionsControls>("editionsControls", buffer)
      : null;

    return {
      item: liquidity,
      pubkey,
    };
  };
