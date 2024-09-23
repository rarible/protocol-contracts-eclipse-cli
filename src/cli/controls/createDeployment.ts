export {};
import { Connection, Keypair, PublicKey } from "@solana/web3.js";
import { createDeployment } from "../../sdk/controls/createControlDeployment";
import { LibreWallet } from "../../anchor/LibreWallet";
import fs from "fs";
import { Command } from "commander";

// Define CLI options
const cli = new Command();

cli
  .version("1.0.0")
  .description("Create an editions account with controls")
  .requiredOption("-k, --keypairPath <keypairPath>", "Path to the keypair file")
  .requiredOption("-s, --symbol <symbol>", "Symbol of the edition")
  .requiredOption("-n, --name <name>", "Name of the edition (can include a template string: {})")
  .requiredOption("-j, --jsonUrl <jsonUrl>", "JSON URL (can include a template string: {})")
  .requiredOption("-t, --treasuryWallet <treasuryWallet>", "Public key of the treasury wallet")
  .requiredOption("--maxMintsPerWallet <maxMintsPerWallet>", "Max mints per wallet, 0 for unlimited")
  .requiredOption("--maxNumberOfTokens <maxNumberOfTokens>", "Max number of tokens, 0 for unlimited")
  .requiredOption("--creators <creators...>", "List of creators in the format '<address>:<share>' (e.g., 'creator1:50 creator2:50')")
  .requiredOption("--royaltyBasisPoints <royaltyBasisPoints>", "Royalty basis points (1000 = 10%)")
  .requiredOption("-r, --rpc <rpc>", "RPC endpoint")
  .parse(process.argv);

const opts = cli.opts();

(async () => {
  try {
    // Setup connection to Solana RPC
    const connection = new Connection(opts.rpc);

    // Load the keypair from the provided file path
    const keyfile = JSON.parse(fs.readFileSync(opts.keypairPath, "utf8"));
    const signerKeypair = Keypair.fromSecretKey(new Uint8Array(keyfile));
    const wallet = new LibreWallet(signerKeypair);

    // Parse creators input
    const creators = opts.creators.map((creator: string) => {
      const [address, share] = creator.split(":");
      if (!address || isNaN(parseInt(share))) {
        throw new Error(`Invalid creator input: ${creator}. Expected format: '<address>:<share>'`);
      }
      return { address: new PublicKey(address), share: parseInt(share) };
    });

    // Create the deployment
    const { editions, editionsControls } = await createDeployment({
      wallet,
      params: {
        name: opts.name,
        symbol: opts.symbol,
        jsonUrl: opts.jsonUrl,
        treasury: opts.treasuryWallet,
        maxMintsPerWallet: +opts.maxMintsPerWallet,
        maxNumberOfTokens: +opts.maxNumberOfTokens,
        royaltyBasisPoints: +opts.royaltyBasisPoints,
        creators,
      },
      connection,
    });

    console.log(`New edition id: ${editions.toBase58()}, controls: ${editionsControls.toBase58()}`);
  } catch (e) {
    console.error("Error creating deployment:", e);
  }
})();
