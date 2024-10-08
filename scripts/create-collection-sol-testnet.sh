
npx ts-node ./src/cli/controls/createDeployment.ts \
  -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS \
  -k ~/.config/solana/id.json \
  -r https://api.devnet.solana.com \
  -s GRLT40 \
  --maxNumberOfTokens 1150 \
  --maxMintsPerWallet 100 \
  -j "ipfs://QmbsXNSkPUtYNmKfYw1mUSVuz9QU8nhu7YvzM1aAQsv6xw/0" \
  -n "Collection name with meta, platform fee and royalties" \
  --creators 674s1Sap3KVnr8WGrY5KGQ69oTYjjgr1disKJo6GpTYw:50 QjzRL6VwKGnpco8wx3cPjtq8ZPhewy7ohq7F5mv2eeR:50 \
  --royaltyBasisPoints 1000 \
  --platformFeeValue 500000 \
  --platformFeeRecipients 674s1Sap3KVnr8WGrY5KGQ69oTYjjgr1disKJo6GpTYw:100 \
  --isFeeFlat \
  --extraMeta "field1:value1" "field2:value2" "field3:value3" "field4:value4" \
  --itemBaseUri "ipfs://QmbsXNSkPUtYNmKfYw1mUSVuz9QU8nhu7YvzM1aAQsv6xw/{}" \
  --itemName "Item T8 V4 #{}"



npx ts-node ./src/cli/controls/addPhase.ts -d AmqfVpkT986fqy3q9PbdXKfBpUwg3ikS2ij1AEDVBvb -k ~/.config/solana/id.json -r https://api.devnet.solana.com  --maxMintsPerWallet 100 --maxMintsTotal 1150 --priceAmount 5000 -s 1709564319 -e 1959564319


npx ts-node ./src/cli/controls/mintWithControls.ts -d AmqfVpkT986fqy3q9PbdXKfBpUwg3ikS2ij1AEDVBvb -k ~/.config/solana/id.json -r https://api.devnet.solana.com  -p 0 -n 1


# modify royalties

# https://testnet.dev2.eclipsenetwork.xyz

npx ts-node ./src/cli/controls/createDeployment.ts \
  -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS \
  -k ~/.config/solana/id.json \
  -r https://testnet.dev2.eclipsenetwork.xyz \
  -s GRLT23 \
  --maxNumberOfTokens 1150 \
  --maxMintsPerWallet 100 \
  -j "ipfs://QmbsXNSkPUtYNmKfYw1mUSVuz9QU8nhu7YvzM1aAQsv6xw/0" \
  -n "Collection V3 name with meta, platform fee and royalties" \
  --creators 6H7iu5V5q2j3G4hjKj6HGFEdUJGZn7MBXaxCjEHD2A4a:50 7Y7bfS5qE2i4J3hjLs1JKJFRXoJHdF2bCjCzTGbJ3h3K:50 \
  --royaltyBasisPoints 1000 \
  --platformFeeValue 500000 \
  --platformFeeRecipients 674s1Sap3KVnr8WGrY5KGQ69oTYjjgr1disKJo6GpTYw:100 \
  --isFeeFlat \
  --extraMeta "field1:value1" "field2:value2" "field3:value3" "field4:value4" \
  --itemBaseUri "ipfs://QmbsXNSkPUtYNmKfYw1mUSVuz9QU8nhu7YvzM1aAQsv6xw/{}" \
  --itemName "Item T8 for V3 #{}"

npx ts-node ./src/cli/controls/addPhase.ts -d GdyxiM4D36YqR84aoBfWiAtUciBVbXugwjZJnuVe2dQN -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz  --maxMintsPerWallet 100 --maxMintsTotal 1150 --priceAmount 0 -s 1709564319 -e 1959564319


npx ts-node ./src/cli/controls/mintWithControls.ts -d GdyxiM4D36YqR84aoBfWiAtUciBVbXugwjZJnuVe2dQN -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz  -p 0 -n 1
