# create collection
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

# create phase with allow list
npx ts-node ./src/cli/controls/addPhase.ts -d AzhRbcBnt8QvTyERm8VQWFwCQbWbyNyfVgE9gyhH4iej -k ~/.config/solana/id.json -r https://api.devnet.solana.com --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 0 -s 1727896829 -e 1759431617 -m ./src/cli/controls/input/input.json

# create phase without allow list
npx ts-node ./src/cli/controls/addPhase.ts -d AzhRbcBnt8QvTyERm8VQWFwCQbWbyNyfVgE9gyhH4iej -k ~/.config/solana/id.json -r https://api.devnet.solana.com --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 666666 -s 1727896829 -e 1759431617

# mint using allow list
npx ts-node ./src/cli/controls/mintWithControls.ts -d AzhRbcBnt8QvTyERm8VQWFwCQbWbyNyfVgE9gyhH4iej -k ~/.config/solana/id.json -r https://api.devnet.solana.com  -p 0 -n 1 -m ./src/cli/controls/input/input.json --allowListPrice 50000000 --allowListMaxClaims 5
# mint without allow list
npx ts-node ./src/cli/controls/mintWithControls.ts -d AzhRbcBnt8QvTyERm8VQWFwCQbWbyNyfVgE9gyhH4iej -k ~/.config/solana/id.json -r https://api.devnet.solana.com  -p 0 -n 1

# view collection
npx ts-node ./src/cli/core/viewDeployment.ts -r https://api.devnet.solana.com  -i AzhRbcBnt8QvTyERm8VQWFwCQbWbyNyfVgE9gyhH4iej 


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
  --itemName "Cat #{}" \
  --ledger true


npx ts-node ./src/cli/controls/addPhase.ts -d 8QLcfQhPHUVoQbjxHRjvcd583ZRuJWLffypqnzzj3ci2 -k ~/.config/solana/id.json -r https://mainnetbeta-rpc.eclipse.xyz --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 500 -s 1709564319 -e 1959564319 --ledger true

npx ts-node ./src/cli/controls/mintWithControls.ts -d 8QLcfQhPHUVoQbjxHRjvcd583ZRuJWLffypqnzzj3ci2 -k ~/.config/solana/id.json -r https://mainnetbeta-rpc.eclipse.xyz -p 0 -n 1 --ledger true

# test network

npx ts-node ./src/cli/controls/createDeployment.ts \
  -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS \
  -k ~/.config/solana/id.json \
  -r https://testnet.dev2.eclipsenetwork.xyz \
  -s CAT3 \
  --maxNumberOfTokens 1000 \
  --maxMintsPerWallet 100 \
  -j "ipfs://QmfJh4B8KySR1KHaXRNWkcDBn67ZuJkzAyaVCWAS8Kcezc/0" \
  -n "Collection of Cats Two Phases" \
  --creators J5xffSinbAQw65TsphSZ8gfaNGAPEfNWL9wwzGNdm3PR:100 \
  --royaltyBasisPoints 1000 \
  --platformFeeValue 500000 \
  --platformFeeRecipients 4yyE2cWHJTU5cu8pem2ApVnHRDGHYvsPvsFCM2WeCPG2:100 \
  --isFeeFlat \
  --extraMeta "type:handmade" "author:Vadim" "value:important" \
  --itemBaseUri "ipfs://QmdHaufjUDJgbZzZ4eFCjtJQyeQpuNwoEvqLm5rq159vC8/{}" \
  --itemName "Test Cat #{}"

npx ts-node ./src/cli/controls/addPhase.ts -d DeJERCMPzrow46iL2NgHK2H1EFUTqUrzmH9vuWvGmMPL -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 150 -s 1727906400 -e 1728597600

npx ts-node ./src/cli/controls/addPhase.ts -d DeJERCMPzrow46iL2NgHK2H1EFUTqUrzmH9vuWvGmMPL -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 250 -s 1728597600 -e 1729461600

npx ts-node ./src/cli/controls/mintWithControls.ts -d DeJERCMPzrow46iL2NgHK2H1EFUTqUrzmH9vuWvGmMPL -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz -p 1 -n 1
