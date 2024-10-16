# change OOLT to without t
npx ts-node ./src/cli/controls/createDeployment.ts \
  -t 4yyE2cWHJTU5cu8pem2ApVnHRDGHYvsPvsFCM2WeCPG2 \
  -k ~/.config/solana/id.json \
  -r https://testnet.dev2.eclipsenetwork.xyz \
  -s OOLT2 \
  --maxNumberOfTokens 0 \
  --maxMintsPerWallet 100 \
  -j "ipfs://QmahJToiR5LzrYkCN79p5ecyWDNpGBNQ9t8tpGCBCRUNZD" \
  -n "Over Open Land" \
  --creators AsSKqK7CkxFUf3KaoQzzr8ZLPm5fFguUtVE5QwGALQQn:100 \
  --royaltyBasisPoints 5000 \
  --platformFeeValue 81830 \
  --platformFeeRecipients AsSKqK7CkxFUf3KaoQzzr8ZLPm5fFguUtVE5QwGALQQn:100 \
  --isFeeFlat \
  --itemBaseUri "ipfs://QmahJToiR5LzrYkCN79p5ecyWDNpGBNQ9t8tpGCBCRUNZD" \
  --itemName "Over Open Land"

npx ts-node ./src/cli/controls/addPhase.ts -d DAdftcfj4pT5HqrJZ6EucCbnDtrnwzrBRd9EK5bKqaGY -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz --maxMintsPerWallet 100 --maxMintsTotal 0 --priceAmount 0 -s 1728664200 -e 1928923400

npx ts-node ./src/cli/controls/mintWithControls.ts -d DAdftcfj4pT5HqrJZ6EucCbnDtrnwzrBRd9EK5bKqaGY -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz -p 0 -n 1
