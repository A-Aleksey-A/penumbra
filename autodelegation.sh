#!/bin/bash

echo "-----------------------------------------------------------------------------"
echo "Проверяем текущую версию..."
version=$(pcli -V | awk '{ print $2 }') &>/dev/null
sleep 15
echo "-----------------------------------------------------------------------------"
echo "Проверяем баланс..."
current_balance=$(pcli view balance | grep penumbra | awk '{ print $2 }' | tr -d 'penumbra' | head -1) &>/dev/null
sleep 15
echo "-----------------------------------------------------------------------------"
if [ $current_balance -le 1500 ]; then
  echo "Недостаточный баланс. Запросите токены с крана!"
elif [ $current_balance -gt 1500 ]; then
  echo "Подготавливаем токены к делегированию..."
  dif=10
  delegate_balance=$(($current_balance-$dif))
  sleep 15
  echo "-----------------------------------------------------------------------------"
  echo "Ищем подходящего валидатора..."
  validator=$(pcli query validator list | grep penumbra | awk '{ print $6 }' | head -1 | sed 's/\x1B\[[0-9;]*[mK]//g') &>/dev/null
  sleep 15
  echo "-----------------------------------------------------------------------------"
  echo "Делегируем токены валидатору..."
  delegate=$(pcli tx delegate "${delegate_balance}"penumbra --to $validator) &>/dev/null
  sleep 15
  echo $delegate  
  echo "-----------------------------------------------------------------------------"
  echo "Обновление и делегация выполнены:"
  echo "Текущая версия: $version"
  echo "Делегированные токены: "${delegate_balance}"penumbra"
  echo "Адреc валидатора: $validator"
  echo "Команда для проверки делегации: pcli view staked"
fi
