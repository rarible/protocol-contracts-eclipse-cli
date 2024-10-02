# create collection
npx ts-node ./src/cli/controls/createDeployment.ts \
  -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS \
  -k ~/.config/solana/id.json \
  -r https://api.devnet.solana.com \
  -s COOLX \
  --maxNumberOfTokens 1150 \
  --maxMintsPerWallet 100 \
  -j "ipfs://QmbsXNSkPUtYNmKfYw1mUSVuz9QU8nhu7YvzM1aAQsv6xw/0" \
  -n "Collection name with meta, platform fee and royalties" \
  --creators 6H7iu5V5q2j3G4hjKj6HGFEdUJGZn7MBXaxCjEHD2A4a:50 7Y7bfS5qE2i4J3hjLs1JKJFRXoJHdF2bCjCzTGbJ3h3K:50 \
  --royaltyBasisPoints 1000 \
  --platformFeeValue 500000 \
  --platformFeeRecipients 6H7iu5V5q2j3G4hjKj6HGFEdUJGZn7MBXaxCjEHD2A4a:50 7Y7bfS5qE2i4J3hjLs1JKJFRXoJHdF2bCjCzTGbJ3h3K:50 \
  --isFeeFlat \
  --extraMeta "field1:value1" "field2:value2" "field3:value3" "field4:value4" \
  --itemBaseUri "ipfs://QmbsXNSkPUtYNmKfYw1mUSVuz9QU8nhu7YvzM1aAQsv6xw/{}" \
  --itemName "Item T8 #{}"

# create phase with allow list
npx ts-node ./src/cli/controls/addPhase.ts -d 14LXuvT1CCUcxzxY87hxAHLTkW46tTpuZUY1ARpvSqmC -k ~/.config/solana/id.json -r https://api.devnet.solana.com --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 100 -s 1727896829 -e 1759431617 -m "[212, 215, 40, 226, 187, 234, 161, 122, 12, 63, 245, 247, 52, 154, 111, 169, 93, 188, 148, 136, 219, 178, 25, 235, 255, 205, 61, 172, 52, 98, 128, 208]"
# create phase without allow list (Currently we have a bug of Error Code: InstructionDidNotDeserialize when creating a a phase without allow list being provided)
npx ts-node ./src/cli/controls/addPhase.ts -d 14LXuvT1CCUcxzxY87hxAHLTkW46tTpuZUY1ARpvSqmC -k ~/.config/solana/id.json -r https://api.devnet.solana.com --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 666666 -s 1727896829 -e 1759431617

# mint on phase 0 with allow list
npx ts-node ./src/cli/controls/mintWithControls.ts -d 14LXuvT1CCUcxzxY87hxAHLTkW46tTpuZUY1ARpvSqmC -k ~/.config/solana/id.json -r https://api.devnet.solana.com  -p 0 -n 1 --merkleProof "[[1,2,3],[1,2,3],[1,2,3]]" --allowListPrice 100000 --allowListMaxClaims 12
# mint on phase 0 without allow list
npx ts-node ./src/cli/controls/mintWithControls.ts -d 14LXuvT1CCUcxzxY87hxAHLTkW46tTpuZUY1ARpvSqmC -k ~/.config/solana/id.json -r https://api.devnet.solana.com  -p 0 -n 1


# view collection
npx ts-node ./src/cli/core/viewDeployment.ts -r https://api.devnet.solana.com  -i 14LXuvT1CCUcxzxY87hxAHLTkW46tTpuZUY1ARpvSqmC 

# modify royalties

# https://testnet.dev2.eclipsenetwork.xyz

npx ts-node ./src/cli/controls/createDeployment.ts \
  -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS \
  -k ~/.config/solana/id.json \
  -r https://api.devnet.solana.com \
  -s COOL \
  --maxNumberOfTokens 1150 \
  --maxMintsPerWallet 100 \
  -j "ipfs://QmbsXNSkPUtYNmKfYw1mUSVuz9QU8nhu7YvzM1aAQsv6xw/0" \
  -n "Collection V2 name with meta, platform fee and royalties" \
  --creators 6H7iu5V5q2j3G4hjKj6HGFEdUJGZn7MBXaxCjEHD2A4a:50 7Y7bfS5qE2i4J3hjLs1JKJFRXoJHdF2bCjCzTGbJ3h3K:50 \
  --royaltyBasisPoints 1000 \
  --platformFeeValue 500000 \
  --platformFeeRecipients 6H7iu5V5q2j3G4hjKj6HGFEdUJGZn7MBXaxCjEHD2A4a:50 7Y7bfS5qE2i4J3hjLs1JKJFRXoJHdF2bCjCzTGbJ3h3K:50 \
  --isFeeFlat \
  --extraMeta "field1:value1" "field2:value2" "field3:value3" "field4:value4" \
  --itemBaseUri "ipfs://QmbsXNSkPUtYNmKfYw1mUSVuz9QU8nhu7YvzM1aAQsv6xw/{}" \
  --itemName "Item T8 for V2 #{}"

npx ts-node ./src/cli/controls/addPhase.ts -d 14LXuvT1CCUcxzxY87hxAHLTkW46tTpuZUY1ARpvSqmC -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 100 -s 1727896829 -e 1759431617 


npx ts-node ./src/cli/controls/mintWithControls.ts -d 14LXuvT1CCUcxzxY87hxAHLTkW46tTpuZUY1ARpvSqmC -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz -p 0 -n 1
