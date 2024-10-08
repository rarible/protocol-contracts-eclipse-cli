export {};
import { Connection, Keypair, PublicKey } from "@solana/web3.js";

import fs from "fs";
import { Command } from "commander";
import { decodeEditions } from "../../anchor/editions/accounts";
import { getProgramInstanceEditions } from "../../anchor/editions/getProgramInstanceEditions";
import { LibreWallet } from "../../anchor/LibreWallet";
import { mintWithControls } from "sdk/controls/mintWithControls";
import { getWallet } from "anchor/utils";

const cli = new Command();

cli
  .version("1.0.0")
  .description("Mint from controls deployment")
  .requiredOption("-k, --keypairPath <keypairPath>", "Keypair")
  .requiredOption("-d, --deploymentId <deploymentId>", "Deployment id")
  .requiredOption("-r, --rpc <rpc>", "RPC")
  .requiredOption("-p, --phaseIndex <phaseIndex>", "Phase index")
  .requiredOption("-n, --numberOfMints <numberOfMints>", "Number of mints")
  .option("--ledger", "if you want to use ledger pass true")
  .parse(process.argv);
// get all fair launches

const opts = cli.opts();

(async () => {
  console.log("test");

  const connection = new Connection(opts.rpc);

  const wallet = await getWallet(opts.ledger, opts.keypairPath);
  await mintWithControls({
    wallet: wallet,
    params: {
      editionsId: opts.deploymentId,
      phaseIndex: +opts.phaseIndex,
      numberOfMints: +opts.numberOfMints
    },
    connection,
  }).finally(()=>{
    console.log("Finished")
  });
})();
