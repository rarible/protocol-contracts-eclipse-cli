import { IdlAccounts } from "@coral-xyz/anchor";
import { BorshCoder, Program } from "@coral-xyz/anchor";
import { PublicKey } from "@solana/web3.js";
import { RaribleEditions } from "./rarible_editions";

export type EditionsDeployment = IdlAccounts<RaribleEditions>["editionsDeployment"];

export const getBase64FromDatabytes = (dataBytes: Buffer, dataType: string) => {
  console.log({ dataBytes });
  const base = dataBytes.toString("base64");
  return `data:${dataType};base64,${base}`;
};

export const decodeEditions =
  (program: Program<RaribleEditions>) => (buffer: Buffer | undefined, pubkey: PublicKey) => {
    const coder = new BorshCoder(program.idl);
    const liquidity = buffer
      ? coder.accounts.decode<EditionsDeployment>("editionsDeployment", buffer)
      : null;

    return {
      item: liquidity,
      pubkey,
    };
  };
