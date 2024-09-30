#!/usr/bin/env ts-node

import { Connection, Keypair, PublicKey } from "@solana/web3.js";
import { Command } from "commander";
import fs from "fs";
import { LibreWallet } from "../../anchor/LibreWallet";
import { modifyPlatformFee } from "../../sdk/controls/modifyPlatformFee"; // Assuming your modifyPlatformFee script is located here
import BN from "bn.js";

const cli = new Command();

cli
  .version("1.0.0")
  .description("Modify platform fee for a specific NFT edition deployment")
  .requiredOption("-k, --keypairPath <keypairPath>", "Path to the keypair file")
  .requiredOption("-r, --rpc <rpc>", "RPC endpoint")
  .requiredOption(
    "-d, --deploymentId <deploymentId>",
    "ID of the deployment to update platform fee"
  )
  .requiredOption(
    "--platformFeeValue <platformFeeValue>",
    "New platform fee value (e.g., amount in lamports or basis points)"
  )
  .option(
    "--isFeeFlat",
    "Indicate if the platform fee is a flat amount. If not provided, it is considered percentage-based."
  )
  .requiredOption(
    "--recipients <recipients>",
    "List of recipients and their shares in the format 'address:share,address:share' (e.g., '8YkPQFLXq23z7Xz1W4oS:50,FzPQA3drtY9xZGR:50')"
  )
  .parse(process.argv);

const opts = cli.opts();

(async () => {
  const connection = new Connection(opts.rpc);

  // Read the keypair file to create a wallet
  const keyfile = JSON.parse(fs.readFileSync(opts.keypairPath, "utf8"));
  const signerKeypair = Keypair.fromSecretKey(new Uint8Array(keyfile));

  // Parse the recipients input (address:share pairs)
  const recipients = opts.recipients.split(",").map((recipient: string) => {
    const [address, share] = recipient.split(":");
    if (!address || isNaN(parseInt(share))) {
      throw new Error(
        `Invalid recipient input: ${recipient}. Expected format: 'address:share'`
      );
    }
    return { address: new PublicKey(address), share: parseInt(share) };
  });

  // Parse platform fee value and isFeeFlat flag
  const platformFeeValue = new BN(opts.platformFeeValue);
  const isFeeFlat = !!opts.isFeeFlat;

  console.log("Options:", opts);

  try {
    // Call modifyPlatformFee function to update platform fee on-chain
    const { editions, txid } = await modifyPlatformFee({
      wallet: new LibreWallet(signerKeypair),
      params: {
        editionsId: opts.deploymentId,
        platformFeeValue,
        isFeeFlat,
        recipients,
      },
      connection,
    });

    console.log(
      `Platform fee updated successfully for editions: ${editions.toBase58()}`
    );
    console.log(`Transaction ID: ${txid}`);
  } catch (e) {
    console.error("Error updating platform fee:", e);
  }
})();
