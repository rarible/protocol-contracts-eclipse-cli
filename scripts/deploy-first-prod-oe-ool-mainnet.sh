# change POD
npx ts-node ./src/cli/controls/createDeployment.ts \
  -t AsSKqK7CkxFUf3KaoQzzr8ZLPm5fFguUtVE5QwGALQQn \
  -k ~/.config/solana/id.json \
  -r https://mainnetbeta-rpc.eclipse.xyz \
  -s POD \
  --maxNumberOfTokens 0 \
  --maxMintsPerWallet 500 \
  -j "ipfs://QmTmNdx3cNT4wv5yyi7ajvPLZTVia6QzWzg1AAkKtauqqs" \
  -n "Path of Discovery" \
  --creators AsSKqK7CkxFUf3KaoQzzr8ZLPm5fFguUtVE5QwGALQQn:100 \
  --royaltyBasisPoints 5000 \
  --platformFeeValue 81830 \
  --platformFeeRecipients AsSKqK7CkxFUf3KaoQzzr8ZLPm5fFguUtVE5QwGALQQn:100 \
  --isFeeFlat \
  --itemBaseUri "ipfs://QmTmNdx3cNT4wv5yyi7ajvPLZTVia6QzWzg1AAkKtauqqs" \
  --itemName "Path of Discovery" \
  --ledger true

npx ts-node ./src/cli/controls/addPhase.ts -d 6wBjjwmWAZzuzAYt9N7EbhPsthE6m2LStNAxZUbViqQb -k ~/.config/solana/id.json -r https://mainnetbeta-rpc.eclipse.xyz --maxMintsPerWallet 100 --maxMintsTotal 0 --priceAmount 0 -s 1729173600 -e 1729778400 --ledger true

npx ts-node ./src/cli/controls/mintWithControls.ts -d 6wBjjwmWAZzuzAYt9N7EbhPsthE6m2LStNAxZUbViqQb -k ~/.config/solana/id.json -r https://mainnetbeta-rpc.eclipse.xyz -p 0 -n 1 --ledger true
