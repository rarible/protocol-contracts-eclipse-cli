import fs from "fs";
import { Command } from "commander";
import { Connection, Keypair } from "@solana/web3.js";
import { LibreWallet } from "../../anchor/LibreWallet";
import { mintWithControls } from "sdk/controls/mintWithControls";
import { IMintWithControls } from "../../sdk/controls/mintWithControls";

const cli = new Command();

cli
  .version("1.0.0")
  .description("Mint from controls deployment")
  .requiredOption("-k, --keypairPath <keypairPath>", "Keypair")
  .requiredOption("-d, --deploymentId <deploymentId>", "Deployment id")
  .requiredOption("-r, --rpc <rpc>", "RPC")
  .requiredOption("-p, --phaseIndex <phaseIndex>", "Phase index")
  .requiredOption("-n, --numberOfMints <numberOfMints>", "Number of mints")
  .option("-m, --merkleProof <merkleProof>", "Merkle proof")
  .option("-a, --allowListPrice <allowListPrice>", "Allow list price")
  .option("-c, --allowListMaxClaims <allowListMaxClaims>", "Allow list max claims")
  .parse(process.argv);
// get all fair launches

const opts = cli.opts();

(async () => {
  const connection = new Connection(opts.rpc);
  const keyfile = JSON.parse(fs.readFileSync(opts.keypairPath, "utf8"));
  const signerKeypair = Keypair.fromSecretKey(new Uint8Array(keyfile));

  /// For an allow list mint, we need to provide the merkle proof together with the allow list price and allow list max claims
  const isAllowListMint = !!opts.merkleProof;
  if (isAllowListMint) {
    if (!opts.allowListPrice || !opts.allowListMaxClaims) {
      throw Error("Allow list price and allow list max claims are required for allow list mint");
    }
  }

  await mintWithControls({
    wallet: new LibreWallet(signerKeypair),
    params: {
      editionsId: opts.deploymentId,
      phaseIndex: +opts.phaseIndex,
      numberOfMints: +opts.numberOfMints,
      merkleProof: isAllowListMint ? JSON.parse(opts.merkleProof) : null,
      allowListPrice: isAllowListMint ? opts.allowListPrice : null,
      allowListMaxClaims: isAllowListMint ? opts.allowListMaxClaims : null,
      isAllowListMint,
    } as IMintWithControls,
    connection,
  })
    .catch(error => {
      console.log("Error during minting");
      console.log(error);
      console.error("FULL ERROR: ", JSON.stringify(error, null, 2));
    })
    .finally(() => {
      console.log("Finished minting");
    });
})();
