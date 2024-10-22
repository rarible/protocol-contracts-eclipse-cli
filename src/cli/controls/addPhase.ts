import { Connection} from "@solana/web3.js";
import fs from "fs";
import path from "path";
import { Command } from "commander";
import { addPhase } from "sdk/controls/addPhase";
import { getWallet } from "anchor/utils";

const cli = new Command();

cli
  .version("1.0.0")
  .description("Add phase to a control deployment")
  .requiredOption("-k, --keypairPath <keypairPath>", "Keypair")
  .requiredOption("-r, --rpc <rpc>", "RPC")
  .requiredOption("-d, --deploymentId <deploymentId>", "controls ID")
  .option("-s, --startTime <startTime>", "start time")
  .option("-e, --endTime <endTime>", "end time")
  .requiredOption("--maxMintsPerWallet <maxMintsPerWallet>", "Max mints per wallet (total), 0 for unlimited")
  .requiredOption("--maxMintsTotal <maxMintsTotal>", "Max mints per phase (total across all wallets), 0 for unlimited")
  .requiredOption("--priceAmount <priceAmount>", "Price per mint in lamports, can be 0")
  .option("-m, --merkleRoot <merkleRootPath>", "Path to JSON file containing merkle root")
  .option("--ledger", "if you want to use ledger pass true")
  .parse(process.argv);

const opts = cli.opts();

(async () => {
  const connection = new Connection(opts.rpc);
  
  let merkleRoot = null;
  if (opts.merkleRoot) {
    const merkleData = JSON.parse(fs.readFileSync(path.resolve(opts.merkleRoot), "utf8"));
    merkleRoot = merkleData.merkle_root;
  }

  const wallet = await getWallet(opts.ledger, opts.keypairPath);

  try {
    const {txid} = await addPhase({
      wallet,
      params: {
        maxMintsPerWallet: +opts.maxMintsPerWallet,
        priceAmount: +opts.priceAmount,
        maxMintsTotal: +opts.maxMintsTotal,
        deploymentId: opts.deploymentId,
        startTime: opts.startTime ? +opts.startTime : null,
        endTime: opts.endTime ? +opts.endTime : null,
        merkleRoot: merkleRoot
      },
      connection,
    });

    console.log(`txid: ${txid}`);
  } catch (e) {
    console.log({ e });
  }
})();
