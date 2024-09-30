
npx ts-node ./src/cli/controls/createDeployment.ts \
  -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS \
  -k ~/.config/solana/id.json \
  -r https://api.devnet.solana.com \
  -s GRLT20 \
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



npx ts-node ./src/cli/controls/addPhase.ts -d BvQ6QPwmFk93zwNPBt6LKkKHp6zZLQuZn4iEuNm9mDmr -k ~/.config/solana/id.json -r https://api.devnet.solana.com  --maxMintsPerWallet 100 --maxMintsTotal 1150 --priceAmount 0 -s 1709564319 -e 1959564319


npx ts-node ./src/cli/controls/mintWithControls.ts -d BvQ6QPwmFk93zwNPBt6LKkKHp6zZLQuZn4iEuNm9mDmr -k ~/.config/solana/id.json -r https://api.devnet.solana.com  -p 0 -n 1


# modify royalties

# https://testnet.dev2.eclipsenetwork.xyz

npx ts-node ./src/cli/controls/createDeployment.ts \
  -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS \
  -k ~/.config/solana/id.json \
  -r https://testnet.dev2.eclipsenetwork.xyz \
  -s GRLT22 \
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

npx ts-node ./src/cli/controls/addPhase.ts -d AEDyi3Cf89zxADzPbT1azqJo1c5LfSoBkhFSd3aPSGYJ -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz  --maxMintsPerWallet 100 --maxMintsTotal 1150 --priceAmount 0 -s 1709564319 -e 1959564319


npx ts-node ./src/cli/controls/mintWithControls.ts -d AEDyi3Cf89zxADzPbT1azqJo1c5LfSoBkhFSd3aPSGYJ -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz  -p 0 -n 1
