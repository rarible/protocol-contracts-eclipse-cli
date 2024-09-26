#!/bin/bash

# Path to the keypair file
KEYPAIR_PATH="$HOME/.config/solana/id.json"

# Solana RPC endpoint
RPC_URL="https://api.devnet.solana.com"

# ID of the deployment you want to update royalties for
DEPLOYMENT_ID="Cegwqg7TiVJbgrQtNmmDpwWUED4sS4tbTCSWDbDEC8qj"

# Royalty basis points (e.g., 1000 for 10%)
ROYALTY_BASIS_POINTS=1100

# Creators and their shares (format: 'address:share,address:share')
CREATORS="6H7iu5V5q2j3G4hjKj6HGFEdUJGZn7MBXaxCjEHD2A4a:42,7Y7bfS5qE2i4J3hjLs1JKJFRXoJHdF2bCjCzTGbJ3h3K:58"

# Run the modifyRoyalties.ts script using npx and ts-node
npx ts-node ./src/cli/controls/modifyRoyalties.ts \
  -k "$KEYPAIR_PATH" \
  -r "$RPC_URL" \
  -d "$DEPLOYMENT_ID" \
  --royaltyBasisPoints "$ROYALTY_BASIS_POINTS" \
  --creators "$CREATORS"
