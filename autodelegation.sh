#!/bin/bash

echo "-----------------------------------------------------------------------------"
version=$(pcli -V | awk '{ print $2 }') &>/dev/null
echo "Проверяем текущую версию..."
sleep 15
echo "-----------------------------------------------------------------------------"
current_balance=$(pcli view balance | grep penumbra | awk '{ print $2 }' | tr -d 'penumbra' | head -1) &>/dev/null
echo "Проверяем баланс..."
sleep 15
echo "-----------------------------------------------------------------------------"
if [ $current_balance -le 10 ]; then
  echo "Недостаточный баланс. Запросите токены с крана!"
elif [ $current_balance -gt 10 ]; then
  echo "Подготавливаем токены к делегированию..."
  dif=10
  delegate_balance=$(($current_balance-$dif))
  validator=$(pcli query validator list | grep penumbra | awk '{ print $6 }' | head -1 | sed 's/\x1B\[[0-9;]*[mK]//g') &>/dev/null
  sleep 15
  echo "-----------------------------------------------------------------------------"
  echo "Ищем подходящего валидатора..."
  delegate=$(pcli tx delegate "${delegate_balance}"penumbra --to $validator) &>/dev/null
  sleep 15
  echo "-----------------------------------------------------------------------------"
  echo "Делегируем токены валидатору..."
  echo $delegate
  echo "-----------------------------------------------------------------------------"
  echo "Обновление и делегация выполнены:"
  echo "Текущая версия: $version"
  echo "Делегированные токены: "${delegate_balance}"penumbra"
  echo "Адреc валидатора: $validator"
  echo "Команда для проверки делегации: pcli view staked"
fi
