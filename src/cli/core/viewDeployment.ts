export {};
import { Connection, Keypair, PublicKey } from "@solana/web3.js";

import { createDeployment } from "sdk/editions/createDeployment";
import fs from "fs";
import { Command } from "commander";
import { PrivateKeyWallet } from "anchor/PrivateKeyWallet";
import { decodeEditions } from "anchor/editions/accounts";
import { getProgramInstanceEditions } from "anchor/editions/getProgramInstanceEditions";
import { getEditionsControlsPda } from "anchor/controls/pdas/getEditionsControlsPda";
import { decodeEditionsControls } from "anchor/controls/accounts";
import { getProgramInstanceEditionsControls } from "anchor/controls/getProgramInstanceEditionsControls";
import { getTokenMetadata } from "spl-token-4";

const cli = new Command();

cli
  .version("1.0.0")
  .description("Add node id to the database")
  .requiredOption("-r, --rpc <rpc>", "RPC")
  .requiredOption("-i, --deploymentId <deploymentId>", "deployment ID")
  .parse(process.argv);

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
    const deploymentObj = decodeEditions(editionProgram)(accountData.data, deploymentPubkey);

    console.log({
      Editions: {
        symbol: deploymentObj.item.symbol,
        creator: deploymentObj.item.creator.toBase58(),
        groupMint: deploymentObj.item.groupMint.toBase58(),
        maxNumberOfTokens: Number(deploymentObj.item.maxNumberOfTokens),
        tokensMinted: Number(deploymentObj.item.numberOfTokensIssued),
        itemNameIsTemplate: deploymentObj.item.itemNameIsTemplate,
        itemUriIsTemplate: deploymentObj.item.itemUriIsTemplate,
      },
    });

    const controlsAccountData = await connection.getAccountInfo(editionsControls);

    if (!controlsAccountData.data) {
      console.log("Core editions deployment - no controls specified");
    } else {
      const editionControlsProgram = getProgramInstanceEditionsControls(connection);

      const editionsControlsObj = decodeEditionsControls(editionControlsProgram)(
        controlsAccountData.data,
        editionsControls
      );

      console.log({
        EditionsControls: {
          address: editionsControls.toBase58(),
          coreDeployment: editionsControlsObj.item.editionsDeployment.toBase58(),
          creator: editionsControlsObj.item.creator.toBase58(),
          treasury: editionsControlsObj.item.treasury.toBase58(),
          maxMintsPerWallet: Number(editionsControlsObj.item.maxMintsPerWallet),
        },
        phases: editionsControlsObj.item.phases.map((item, idx) => ({
          phaseIndex: idx,
          currentMints: Number(item.currentMints),
          maxMintsPerWallet: Number(item.maxMintsPerWallet),
          maxMintsTotal: Number(item.maxMintsTotal),
          startTime: Number(item.startTime),
          endTime: Number(item.endTime),
          priceAmount: Number(item.priceAmount),
          priceToken: item.priceToken ? item.priceToken.toBase58() : null,
          merkleRoot: item.merkleRoot ? JSON.stringify(item.merkleRoot) : null,
          isPrivate: item.isPrivate ? true : false
        })),
      });
    }

    const tokenMetadata = await getTokenMetadata(connection, deploymentObj.item.groupMint);
    console.log({
      "TokenMetadata": {
        name: tokenMetadata.name,
        symbol: tokenMetadata.symbol,
        uri: tokenMetadata.uri,
        updateAuthority: tokenMetadata.updateAuthority.toBase58(),
        mint: tokenMetadata.mint.toBase58(),
        aditionalMetadata: tokenMetadata.additionalMetadata ? JSON.stringify(tokenMetadata.additionalMetadata) : null
      }
    });
  
  } catch (e) {
    console.log({ e });
  }
})();
