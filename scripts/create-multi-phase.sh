npx ts-node ./src/cli/controls/createDeployment.ts \
  -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS \
  -k ~/.config/solana/id.json \
  -r https://testnet.dev2.eclipsenetwork.xyz \
  -s CAT1 \
  --maxNumberOfTokens 1000 \
  --maxMintsPerWallet 100 \
  -j "ipfs://QmfJh4B8KySR1KHaXRNWkcDBn67ZuJkzAyaVCWAS8Kcezc/0" \
  -n "Collection of Cats" \
  --creators J5xffSinbAQw65TsphSZ8gfaNGAPEfNWL9wwzGNdm3PR:100 \
  --royaltyBasisPoints 1000 \
  --platformFeeValue 500000 \
  --platformFeeRecipients 4yyE2cWHJTU5cu8pem2ApVnHRDGHYvsPvsFCM2WeCPG2:100 \
  --isFeeFlat \
  --extraMeta "type:handmade" "author:Vadim" "value:important" \
  --itemBaseUri "ipfs://QmdHaufjUDJgbZzZ4eFCjtJQyeQpuNwoEvqLm5rq159vC8/{}" \
  --itemName "Eclipse Cat #{}"

npx ts-node ./src/cli/controls/addPhase.ts \
  -d EW9aJXUoTaqe5yqLWnkiRFPiT9oiueMqfxyKkMo6s2sy \
  -k ~/.config/solana/id.json \
  -r https://testnet.dev2.eclipsenetwork.xyz \
  --maxMintsPerWallet 100 \
  --maxMintsTotal 1000 \
  --priceAmount 0 \
  -s 1709564319 \  # Timestamp for October 5, 2024
  -e 1709740800    # Timestamp for October 7, 2024

npx ts-node ./src/cli/controls/addPhase.ts \
  -d EW9aJXUoTaqe5yqLWnkiRFPiT9oiueMqfxyKkMo6s2sy \
  -k ~/.config/solana/id.json \
  -r https://testnet.dev2.eclipsenetwork.xyz \
  --maxMintsPerWallet 100 \
  --maxMintsTotal 1000 \
  --priceAmount 0 \
  -s 1709827200 \  # Timestamp for October 8, 2024
  -e 1712121600    # Timestamp for November 8, 2024

npx ts-node ./src/cli/controls/addPhase.ts \
  -d EW9aJXUoTaqe5yqLWnkiRFPiT9oiueMqfxyKkMo6s2sy \
  -k ~/.config/solana/id.json \
  -r https://testnet.dev2.eclipsenetwork.xyz \
  --maxMintsPerWallet 100 \
  --maxMintsTotal 1000 \
  --priceAmount 0 \
  -s 1709740800 \  # Timestamp for October 7, 2024
  -e 1712121600 \  # Timestamp for November 8, 2024
  --active false

npx ts-node ./src/cli/controls/mintWithControls.ts \ 
  -d EW9aJXUoTaqe5yqLWnkiRFPiT9oiueMqfxyKkMo6s2sy \ 
  -k ~/.config/solana/id.json  \
  -r https://testnet.dev2.eclipsenetwork.xyz \
  -p 0 \
  -n 1
