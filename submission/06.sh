# Only one tx in block 243,821 signals opt-in RBF. What is its txid?

# RBF is signaled when any input has sequence <= 0xFFFFFFFD (4294967293).
bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 243821) 2 | jq -r '.tx[] | select(.vin[].sequence == 4294967293) | .txid'