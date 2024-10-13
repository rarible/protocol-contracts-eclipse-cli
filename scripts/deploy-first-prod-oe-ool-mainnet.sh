# change OOLT to without t
npx ts-node ./src/cli/controls/createDeployment.ts \
  -t 4yyE2cWHJTU5cu8pem2ApVnHRDGHYvsPvsFCM2WeCPG2 \
  -k ~/.config/solana/id.json \
  -r https://mainnetbeta-rpc.eclipse.xyz \
  -s OOL \
  --maxNumberOfTokens 0 \
  --maxMintsPerWallet 100 \
  -j "ipfs://QmYFLidfYnAcWPUWT1XkimVN7KKrs1n7P76xwWaQGvMu8i" \
  -n "Over Open Land" \
  --creators J5xffSinbAQw65TsphSZ8gfaNGAPEfNWL9wwzGNdm3PR:100 \
  --royaltyBasisPoints 5000 \
  --platformFeeValue 81830 \
  --platformFeeRecipients 4yyE2cWHJTU5cu8pem2ApVnHRDGHYvsPvsFCM2WeCPG2:100 \
  --isFeeFlat \
  --itemBaseUri "ipfs://QmboLkdYkaunVsXDcfVQRKo9wysRk22z4nvvcpvoNbkPX1" \
  --itemName "Over Open Land" \
  --ledger true

npx ts-node ./src/cli/controls/addPhase.ts -d 8iHEUGSycmHcCDfBtZgNVgTm5WGgsRaiYxtDpnYMCAzq -k ~/.config/solana/id.json -r https://mainnetbeta-rpc.eclipse.xyz --maxMintsPerWallet 100 --maxMintsTotal 0 --priceAmount 0 -s 1729000800 -e 1729432800 --ledger true

npx ts-node ./src/cli/controls/mintWithControls.ts -d 8iHEUGSycmHcCDfBtZgNVgTm5WGgsRaiYxtDpnYMCAzq -k ~/.config/solana/id.json -r https://mainnetbeta-rpc.eclipse.xyz -p 0 -n 1 --ledger true
