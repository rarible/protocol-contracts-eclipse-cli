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
npx ts-node ./src/cli/controls/addPhase.ts -d 14LXuvT1CCUcxzxY87hxAHLTkW46tTpuZUY1ARpvSqmC -k ~/.config/solana/id.json -r https://api.devnet.solana.com --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 0 -s 1727896829 -e 1759431617 -m "[200, 20, 187, 77, 207, 65, 101, 66, 8, 214, 75, 181, 94, 166, 207, 14, 189, 98, 63, 246, 86, 51, 66, 212, 201, 216, 94, 55, 80, 10, 100, 195]"
# create phase without allow list
npx ts-node ./src/cli/controls/addPhase.ts -d 14LXuvT1CCUcxzxY87hxAHLTkW46tTpuZUY1ARpvSqmC -k ~/.config/solana/id.json -r https://api.devnet.solana.com --maxMintsPerWallet 100 --maxMintsTotal 1000 --priceAmount 666666 -s 1727896829 -e 1759431617

# mint on phase 0 with allow list
npx ts-node ./src/cli/controls/mintWithControls.ts -d 14LXuvT1CCUcxzxY87hxAHLTkW46tTpuZUY1ARpvSqmC -k ~/.config/solana/id.json -r https://api.devnet.solana.com  -p 3 -n 1 --merkleProof "[[92, 12, 241, 133, 198, 141, 130, 202, 8, 30, 73, 27, 50, 211, 110, 142, 143, 158, 86, 31,248, 117, 241, 104, 109, 95, 170, 74, 91, 198, 100, 48],[31, 149, 124, 159, 90, 65, 102, 168, 152, 235, 3, 7, 159, 100, 130, 91, 63, 137, 75, 65,178, 1, 139, 23, 206, 77, 148, 247, 44, 84, 191, 20]]" --allowListPrice 0 --allowListMaxClaims 5
# mint on phase 0 without allow list (@dev @tbd Currently I'm not able to mint on a phase that has a price set.)
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
