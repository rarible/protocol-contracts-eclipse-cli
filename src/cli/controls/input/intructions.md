# Temporary Instructions for Merkle Root and Proof

## Overview
While we are in the process of building the eclipse mono-repo and automating this process, please follow these temporary instructions.

## Steps
1. Generate your "merkle_root" and "merkle_proof" using svm-merkle-trees.
2. Place the generated data in a file named `input.json` within this folder.
3. Format the `input.json` file as shown in the example below.

## Example `input.json` Format

```json
{
  "merkle_root": [
    // ... merkle root data ...
  ],
  "merkle_proof": [
    [
      // ... first proof element ...
    ],
    [
      // ... second proof element ...
    ]
    // ... additional proof elements ...
  ]
}
```

## Note
This is a temporary solution. Once the eclipse mono-repo is complete and the process is automated, these manual steps will no longer be necessary.