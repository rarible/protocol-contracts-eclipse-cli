
npx ts-node ./src/cli/controls/createDeployment.ts \
  -t 4yyE2cWHJTU5cu8pem2ApVnHRDGHYvsPvsFCM2WeCPG2 \
  -k ~/.config/solana/id.json \
  -r https://api.devnet.solana.com \
  -s GRLT44 \
  --maxNumberOfTokens 1150 \
  --maxMintsPerWallet 100 \
  -j "ipfs://QmbsXNSkPUtYNmKfYw1mUSVuz9QU8nhu7YvzM1aAQsv6xw/0" \
  -n "Collection name with meta, platform fee and royalties" \
  --creators 4yyE2cWHJTU5cu8pem2ApVnHRDGHYvsPvsFCM2WeCPG2:100 \
  --royaltyBasisPoints 1000 \
  --platformFeeValue 500000 \
  --platformFeeRecipients 4yyE2cWHJTU5cu8pem2ApVnHRDGHYvsPvsFCM2WeCPG2:100 \
  --isFeeFlat \
  --extraMeta "field1:value1" "field2:value2" "field3:value3" "field4:value4" \
  --itemBaseUri "ipfs://QmbsXNSkPUtYNmKfYw1mUSVuz9QU8nhu7YvzM1aAQsv6xw/{}" \
  --itemName "Item T8 V4 #{}" \
  --ledger true

npx ts-node ./src/cli/controls/addPhase.ts \
  -d 5MDhwFEQqRwsG4NZMT7rBbhXiiwDM3Hku3jj4VqZFSHV \
  -k ~/.config/solana/id.json \
  -r https://api.devnet.solana.com \
   --maxMintsPerWallet 100 \
  --maxMintsTotal 1150  \
  --priceAmount 5000 \
  -s 1709564319 \ 
  -e 1959564319 \
  --ledger true

npx ts-node ./src/cli/controls/mintWithControls.ts \
  -d 5MDhwFEQqRwsG4NZMT7rBbhXiiwDM3Hku3jj4VqZFSHV \
  -k ~/.config/solana/id.json \
  -r https://api.devnet.solana.com \
  -p 0 \
  -n 1 \
  --ledger true

# modify royalties

# https://testnet.dev2.eclipsenetwork.xyz

npx ts-node ./src/cli/controls/createDeployment.ts \
  -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS \
  -k ~/.config/solana/id.json \
  -r https://testnet.dev2.eclipsenetwork.xyz \
  -s CAT1 \
  --maxNumberOfTokens 1150 \
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

npx ts-node ./src/cli/controls/addPhase.ts -d 8QLcfQhPHUVoQbjxHRjvcd583ZRuJWLffypqnzzj3ci2 -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz  --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 0 -s 1709564319 -e 1959564319


npx ts-node ./src/cli/controls/mintWithControls.ts -d 8QLcfQhPHUVoQbjxHRjvcd583ZRuJWLffypqnzzj3ci2 -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz  -p 0 -n 1


# https://mainnetbeta-rpc.eclipse.xyz

npx ts-node ./src/cli/controls/createDeployment.ts \
  -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS \
  -k ~/.config/solana/id.json \
  -r https://mainnetbeta-rpc.eclipse.xyz \
  -s CAT1 \
  --maxNumberOfTokens 1150 \
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
  --itemName "Cat #{}" \
  --ledger true


npx ts-node ./src/cli/controls/addPhase.ts \
  -d 5MDhwFEQqRwsG4NZMT7rBbhXiiwDM3Hku3jj4VqZFSHV \
  -k ~/.config/solana/id.json \
  -r https://mainnetbeta-rpc.eclipse.xyz \
   --maxMintsPerWallet 100 \
  --maxMintsTotal 1000  \
  --priceAmount 500 \
  -s 1709564319 \ 
  -e 1959564319 \
  --ledger true

npx ts-node ./src/cli/controls/mintWithControls.ts \
  -d 5MDhwFEQqRwsG4NZMT7rBbhXiiwDM3Hku3jj4VqZFSHV \
  -k ~/.config/solana/id.json \
  -r https://mainnetbeta-rpc.eclipse.xyz \
  -p 0 \
  -n 1 \
  --ledger true