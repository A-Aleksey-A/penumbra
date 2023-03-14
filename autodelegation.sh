#!/bin/bash

#validator=$(pcli query validator list | grep penumbra | awk '{ print $6 }' | head -1)
#validator=$(pcli query validator list | grep penumbra | awk '{ print $6 }' | head -1 | sed 's/\x1B\[[0-9;]*[mK]//g')
#echo $validator > penumbra-validators.txt

#pcli query validator list > penumbra-validators.txt

# Выводит первого активного валидатора из списка
validator=$(pcli query validator list | grep penumbra | awk '{ print $6 }' | head -1 | sed 's/\x1B\[[0-9;]*[mK]//g')
echo $validator

# Выводит баланс для стейкинга (пока минус 50)
current_balance=$(pcli view balance | grep penumbra | awk '{ print $2 }' | tr -d 'penumbra' | head -1)
dif=10
stake_balance=$(($current_balance-$dif))
echo $current_balance
echo $stake_balance

# Стейкает монетки первому активному валидатору из списка
stake=$(pcli tx delegate "${stake_balance}"penumbra --to $validator)
echo $stake
