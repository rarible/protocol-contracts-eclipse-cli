# change OOLT to without t
npx ts-node ./src/cli/controls/createDeployment.ts \
  -t 4yyE2cWHJTU5cu8pem2ApVnHRDGHYvsPvsFCM2WeCPG2 \
  -k ~/.config/solana/id.json \
  -r https://testnet.dev2.eclipsenetwork.xyz \
  -s POD2 \
  --maxNumberOfTokens 0 \
  --maxMintsPerWallet 100 \
  -j "ipfs://QmTmNdx3cNT4wv5yyi7ajvPLZTVia6QzWzg1AAkKtauqqs" \
  -n "Path of Discovery" \
  --creators AsSKqK7CkxFUf3KaoQzzr8ZLPm5fFguUtVE5QwGALQQn:100 \
  --royaltyBasisPoints 5000 \
  --platformFeeValue 81830 \
  --platformFeeRecipients AsSKqK7CkxFUf3KaoQzzr8ZLPm5fFguUtVE5QwGALQQn:100 \
  --isFeeFlat \
  --itemBaseUri "ipfs://QmTmNdx3cNT4wv5yyi7ajvPLZTVia6QzWzg1AAkKtauqqs" \
  --itemName "Path of Discovery"

npx ts-node ./src/cli/controls/addPhase.ts -d BSDDZrGVGQZWsa46RQxxfkfubuLcdrPnyrhLfpwYzZTu -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz --maxMintsPerWallet 100 --maxMintsTotal 0 --priceAmount 0 -s 1729159200 -e 1928923400

npx ts-node ./src/cli/controls/mintWithControls.ts -d BSDDZrGVGQZWsa46RQxxfkfubuLcdrPnyrhLfpwYzZTu -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz -p 0 -n 1
