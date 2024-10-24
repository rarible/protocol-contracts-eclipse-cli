import { Wallet as AnchorWallet, Program } from "@coral-xyz/anchor";
import {
  useConnection,
  useWallet
} from "@solana/wallet-adapter-react";
import { Keypair, PublicKey } from "@solana/web3.js";
import { ReactNode, createContext, useEffect, useState } from "react";
import { PROGRAM_ID_EDITIONS } from "./constants";
import { PROGRAM_ID } from "@metaplex-foundation/mpl-token-metadata";
import { RaribleEditions } from "./rarible_editions";
import { getProgramInstanceEditions } from "./getProgramInstanceEditions";
import { PrivateKeyWallet } from "anchor/fair_launch/PrivateKeyWallet";

export const EditionsProgramContext = createContext<{
  program: Program<RaribleEditions>;
  setProgramId: (p: PublicKey) => any;
}>(undefined!);

export const EditionsProgramProvider = ({
  children,
}: {
  children: ReactNode;
}) => {
  const wallet = useWallet();

  const [program, setProgram] = useState<Program<RaribleEditions>>();

  const [programId, setProgramId] = useState<PublicKey>(
    new PublicKey(PROGRAM_ID_EDITIONS)
  );

  const { connection } = useConnection();

  useEffect(() => {
    try {
      const _program = getProgramInstanceEditions(
        connection,
        new PrivateKeyWallet(Keypair.generate())
      );
      setProgram(_program);
    } catch (e) {
      console.log(e, connection);
    }
  }, [wallet, connection, programId]);

  return program?.programId ? (
    <EditionsProgramContext.Provider value={{ program, setProgramId }}>
      {children}
    </EditionsProgramContext.Provider>
  ) : (
    <></>
  );
};
