#!/bin/bash

# Path to the keypair file
KEYPAIR_PATH="$HOME/.config/solana/id.json"

# Solana RPC endpoint
RPC_URL="https://api.devnet.solana.com"

# ID of the deployment you want to update royalties for
DEPLOYMENT_ID="AQCivvumc6hGZrMvJScDkUe8etX6RSrL1QpNZxEZ4kyY"

# Royalty basis points (e.g., 1000 for 10%)
ROYALTY_BASIS_POINTS=1100

# Creators and their shares (format: 'address:share,address:share')
CREATORS="6H7iu5V5q2j3G4hjKj6HGFEdUJGZn7MBXaxCjEHD2A4a:100"

# Run the modifyRoyalties.ts script using npx and ts-node
npx ts-node ./src/cli/controls/modifyRoyalties.ts \
  -k "$KEYPAIR_PATH" \
  -r "$RPC_URL" \
  -d "$DEPLOYMENT_ID" \
  --royaltyBasisPoints "$ROYALTY_BASIS_POINTS" \
  --creators "$CREATORS"
