npx ts-node ./src/cli/controls/createDeployment.ts \
  -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS \
  -k ~/.config/solana/id.json \
  -r https://api.devnet.solana.com \
  -s CAT2 \
  --maxNumberOfTokens 1000 \
  --maxMintsPerWallet 100 \
  -u "ipfs://QmfJh4B8KySR1KHaXRNWkcDBn67ZuJkzAyaVCWAS8Kcezc/0" \
  -n "Collection of Cats" \
  --creators J5xffSinbAQw65TsphSZ8gfaNGAPEfNWL9wwzGNdm3PR:100 \
  --royaltyBasisPoints 1000 \
  --platformFeeValue 500000 \
  --platformFeeRecipients 4yyE2cWHJTU5cu8pem2ApVnHRDGHYvsPvsFCM2WeCPG2:100 \
  --isFeeFlat \
  --extraMeta "type:handmade" "author:Vadim" "value:important" \
  --itemBaseUri "ipfs://QmdHaufjUDJgbZzZ4eFCjtJQyeQpuNwoEvqLm5rq159vC8/{}" \
  --itemBaseName "Cat #{}" 


npx ts-node ./src/cli/controls/addPhase.ts -d D4W923tv5rGnAzBXeAEBxrkzsffuwewndibgE69J485M -k ~/.config/solana/id.json -r https://api.devnet.solana.com --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 500 -s 1709564319 -e 1959564319

npx ts-node ./src/cli/controls/mintWithControls.ts -d D4W923tv5rGnAzBXeAEBxrkzsffuwewndibgE69J485M -k ~/.config/solana/id.json -r https://api.devnet.solana.com -p 0 -n 1
