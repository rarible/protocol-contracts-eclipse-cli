#!/bin/bash

KEYPAIR_PATH="$HOME/.config/solana/id.json"
RPC_URL="https://mainnetbeta-rpc.eclipse.xyz"
DEPLOYMENT_ID="6wBjjwmWAZzuzAYt9N7EbhPsthE6m2LStNAxZUbViqQb"
PLATFORM_FEE_VALUE=818300
IS_FEE_FLAT=true
RECIPIENTS="AsSKqK7CkxFUf3KaoQzzr8ZLPm5fFguUtVE5QwGALQQn:100"

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
  --recipients "$RECIPIENTS" \
  --ledger true