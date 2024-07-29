export {};
import { Connection, Keypair, PublicKey } from "@solana/web3.js";

import { createDeployment } from "sdk/editions/createDeployment";
import fs from "fs";
import { Command } from "commander";
import { LibreWallet } from "anchor/LibreWallet";
import { decodeEditions } from "anchor/editions/accounts";
import { getProgramInstanceEditions } from "anchor/editions/getProgramInstanceEditions";
import { getEditionsControlsPda } from "anchor/controls/pdas/getEditionsControlsPda";
import { decodeEditionsControls } from "anchor/controls/accounts";
import { getProgramInstanceEditionsControls } from "anchor/controls/getProgramInstanceEditionsControls";

const cli = new Command();

cli
  .version("1.0.0")
  .description("Add node id to the database")
  .requiredOption("-r, --rpc <rpc>", "RPC")
  .requiredOption("-i, --deploymentId <deploymentId>", "deployment ID")

  .parse(process.argv);
// get all fair launches

const opts = cli.opts();

(async () => {
  const connection = new Connection(opts.rpc);

  const deploymentPubkey = new PublicKey(opts.deploymentId);
  try {
    const accountData = await connection.getAccountInfo(deploymentPubkey);

    const editionsControls = getEditionsControlsPda(deploymentPubkey);
    const editionProgram = getProgramInstanceEditions(connection);
    if (!accountData) {
      throw Error(`Deployment ${opts.deploymentId} not found`);
    }
    const deploymentObj = decodeEditions(editionProgram)(
      accountData.data,
      deploymentPubkey
    );

    console.log({
      coreDeployment: {
        creator: deploymentObj.item.creator.toBase58(),
        groupMint: deploymentObj.item.groupMint.toBase58(),
        maxNumberOfTokens: Number(deploymentObj.item.maxNumberOfTokens),
        name: deploymentObj.item.name,
        tokensMinted: Number(deploymentObj.item.numberOfTokensIssued),
        offchainUrl: deploymentObj.item.offchainUrl,
        symbol: deploymentObj.item.symbol,
        nameIsTemplate: deploymentObj.item.nameIsTemplate,
        urlIsTemplate: deploymentObj.item.urlIsTemplate,
      },
    });

    const controlsAccountData = await connection.getAccountInfo(
      editionsControls
    );

    if (!controlsAccountData.data) {
      console.log("Core editions deployment - no controls specified");
    } else {
      const editionControlsProgram =
        getProgramInstanceEditionsControls(connection);

      const editionsControlsObj = decodeEditionsControls(
        editionControlsProgram
      )(controlsAccountData.data, editionsControls);

      console.log({
        phases: editionsControlsObj.item.phases.map((item, idx) => ({
          phaseIndex: idx,
          currentMints: Number(item.currentMints),
          startTime: Number(item.startTime),
          endTime: Number(item.endTime),
          priceAmount: Number(item.priceAmount),
        })),
      });
    }
  } catch (e) {
    console.log({ e });
  }
})();
