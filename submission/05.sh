# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb

TOTAL_OUTPUTS=$(bitcoin-cli -signet getrawtransaction b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb true | jq '[.vout[].value] | add')

PREV_TXID=$(bitcoin-cli -signet getrawtransaction b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb true | jq -r '.vin[0].txid')
PREV_VOUT=$(bitcoin-cli -signet getrawtransaction b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb true | jq -r '.vin[0].vout')

INPUT_VALUE=$(bitcoin-cli -signet getrawtransaction $PREV_TXID true | jq ".vout[$PREV_VOUT].value")

echo "$INPUT_VALUE $TOTAL_OUTPUTS" | awk '{printf "%.0f\n", ($1 - $2) * 100000000}'