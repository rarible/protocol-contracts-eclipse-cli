#!/bin/bash

KEYPAIR_PATH="$HOME/.config/solana/id.json"
RPC_URL="https://api.devnet.solana.com"
DEPLOYMENT_ID="AQCivvumc6hGZrMvJScDkUe8etX6RSrL1QpNZxEZ4kyY"
PLATFORM_FEE_VALUE=543000
IS_FEE_FLAT=true
RECIPIENTS="6H7iu5V5q2j3G4hjKj6HGFEdUJGZn7MBXaxCjEHD2A4a:50,7Y7bfS5qE2i4J3hjLs1JKJFRXoJHdF2bCjCzTGbJ3h3K:50"

if [ "$IS_FEE_FLAT" = true ]; then
  IS_FEE_FLAT_FLAG="--isFeeFlat"
else
  IS_FEE_FLAT_FLAG=""
fi

npx ts-node ./src/cli/controls/modifyPlatformFee.ts \
  -k "$KEYPAIR_PATH" \
  -r "$RPC_URL" \
  -d "$DEPLOYMENT_ID" \
  --platformFeeValue "$PLATFORM_FEE_VALUE" \
  $IS_FEE_FLAT_FLAG \
  --recipients "$RECIPIENTS"