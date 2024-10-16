# change OOLT to without t
npx ts-node ./src/cli/controls/createDeployment.ts \
  -t AsSKqK7CkxFUf3KaoQzzr8ZLPm5fFguUtVE5QwGALQQn \
  -k ~/.config/solana/id.json \
  -r https://mainnetbeta-rpc.eclipse.xyz \
  -s OOL \
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
  --itemName "Over Open Land" \
  --ledger true

npx ts-node ./src/cli/controls/addPhase.ts -d 8iHEUGSycmHcCDfBtZgNVgTm5WGgsRaiYxtDpnYMCAzq -k ~/.config/solana/id.json -r https://mainnetbeta-rpc.eclipse.xyz --maxMintsPerWallet 100 --maxMintsTotal 0 --priceAmount 0 -s 1729173600 -e 1729778400 --ledger true

npx ts-node ./src/cli/controls/mintWithControls.ts -d 8iHEUGSycmHcCDfBtZgNVgTm5WGgsRaiYxtDpnYMCAzq -k ~/.config/solana/id.json -r https://mainnetbeta-rpc.eclipse.xyz -p 0 -n 1 --ledger true
