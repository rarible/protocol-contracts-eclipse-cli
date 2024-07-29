import {
  ExtensionType,
  Mint,
  MintLayout,
  TOKEN_2022_PROGRAM_ID,
  getExtensionData,
  getExtensionTypes,
  unpackMint
} from "spl-token-4";
import {
  TokenMetadata,
  unpack as unpackTokenMetadata
} from "@solana/spl-token-metadata";
import { AccountInfo, PublicKey } from "@solana/web3.js";

export const decodeMint2022 = (
  accountInfo: AccountInfo<Buffer>,
  pubkey: PublicKey
) => {
  try {
    let unpacked: Mint & { metadata?: TokenMetadata } = unpackMint(
      pubkey,
      accountInfo,
      accountInfo.owner
    );
    const extensionTypes = getExtensionTypes(unpacked.tlvData);
    for (const extensionType of extensionTypes) {
      let extensionData = getExtensionData(extensionType, unpacked.tlvData);
      if (extensionType === ExtensionType.TokenMetadata) {
        unpacked = {
          ...unpacked,
          metadata: unpackTokenMetadata(extensionData),
        };
      }
    }

    return {
      item: unpacked ?? null, //metadata ?? null,
      pubkey,
    };
  } catch (e) {
    console.log(e);
    return {
      item: null,
      pubkey,
    };
  }
};

export const decodeMint = (buffer: Buffer, pubkey: PublicKey) => {
  try {
    // console.log({buffer});
    const mint = MintLayout.decode(buffer);

    return {
      item: mint ?? null, //metadata ?? null,
      pubkey,
    };
  } catch (e) {
    // console.log(e);
    return {
      item: null,
      pubkey,
    };
  }
};
