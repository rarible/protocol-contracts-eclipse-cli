import { Keypair } from "@solana/web3.js";
import { LedgerWallet } from "./LedgerWallet"; // Adjust the import path based on your project structure
import { LibreWallet } from "./LibreWallet";   // Adjust the import path based on your project structure
import * as fs from "fs";

/**
 * Creates a wallet based on the environment variable `WALLET_TYPE`.
 * @returns A wallet instance of either LibreWallet or LedgerWallet.
 */
export async function getWallet(isLedger: boolean = false, keypairPath: string = ""): Promise<LibreWallet | LedgerWallet> {
  let walletType = process.env.WALLET_TYPE;
  if(isLedger) {
    walletType = "ledger";
  }
  if (!walletType) {
    walletType =  "keypair";
  }

  if (walletType === "keypair") {
    // Load the keypair from the file
    if (keypairPath.length == 0) {
      keypairPath = process.env.KEYPAIR_PATH;
    }

    const keyfile = JSON.parse(fs.readFileSync(keypairPath, "utf8"));
    const signerKeypair = Keypair.fromSecretKey(new Uint8Array(keyfile));
    return new LibreWallet(signerKeypair);

  } else if (walletType === "ledger") {
    // Initialize Ledger Wallet
    const wallet = new LedgerWallet();
    await wallet.init();  // Make sure to initialize the Ledger device
    return wallet;

  } else {
    throw new Error(`Unsupported wallet type: ${walletType}`);
  }
}
