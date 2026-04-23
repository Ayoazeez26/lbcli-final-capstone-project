# How many new outputs were created by block 243,825?

BLOCKHASH=$(bitcoin-cli -signet getblockhash 243825)

# Get all transactions in the block and count total vouts
bitcoin-cli -signet getblock $BLOCKHASH 2 | jq '[.tx[].vout] | map(length) | add'