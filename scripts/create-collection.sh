// https://testnet.dev2.eclipsenetwork.xyz

##### 111

npx ts-node ./src/cli/controls/createDeployment.ts -t BTicWgGhoTsBANuirXS7UCeF6bxfvTnCaxM5HQRRfGZS -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz -s GRLT3 --maxNumberOfTokens 1150 --maxMintsPerWallet 100 -u "ipfs://QmbsXNSkPUtYNmKfYw1mUSVuz9QU8nhu7YvzM1aAQsv6xw/{}" -n "Test Collection Meta: {}"


##### 222

npx ts-node ./src/cli/controls/addPhase.ts -d 876ohUKLW5shgd8qd49dknW7v7KfGGgRv1t49sSGZfWm -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz  --maxMintsPerWallet 100 --maxMintsTotal 1150 --priceAmount 0 -s 1709564319 -e 1959564319


### 333

npx ts-node ./src/cli/controls/mintWithControls.ts -d 876ohUKLW5shgd8qd49dknW7v7KfGGgRv1t49sSGZfWm -k ~/.config/solana/id.json -r https://testnet.dev2.eclipsenetwork.xyz  -p 0 -n 1
