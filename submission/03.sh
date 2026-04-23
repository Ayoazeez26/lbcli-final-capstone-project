# Which tx in block 216,351 spends the coinbase output of block 216,128?
# Get coinbase txid of block 216,128
COINBASE_TXID=$(bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 216128) 1 | jq -r '.tx[0]')

# Get all txs in block 216,351 and find which one spends it
bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 216351) 2 | \
  jq -r --arg txid "$COINBASE_TXID" '.tx[] | select(.vin[].txid == $txid) | .txid'