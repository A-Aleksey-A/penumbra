#!/bin/bash

# Check the balance of the account
balance=$(pcli view balance | grep penumbra | awk '{ print $2 }' | sed 's/penumbra//;s/,//')
echo "Current balance: $balance"

# Calculate the amount to delegate
int_balance=${balance%%.*}
amount=$(($int_balance-5))
echo "Amount to delegate: $amount"

# Get the first validator from the list of active validators
validator=$(pcli query validator list | grep penumbra | awk '{ gsub(/^[[:space:]]+|[[:space:]]+$/, ""); print $6 }' | head -1)
echo "The address of the active validator: $validator"

# Delegate the tokens to the first active validator
echo "Delegating $amount penumbra tokens to $validator"
pcli tx delegate "${amount}penumbra" --to "$validator"
