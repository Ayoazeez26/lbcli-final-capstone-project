# what is the coinbase tx in this block 243,834

BLOCK_HASH=$(bitcoin-cli -signet getblockhash 243834)

bitcoin-cli -signet getblock $BLOCK_HASH 1 | jq -r '.tx[0]'