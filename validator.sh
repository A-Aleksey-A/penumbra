#!/bin/bash

version=$(pcli -V | awk '{ print $2 }') &>/dev/null
echo "Текущая версия Penumbra: $version"

echo "-----------------------------------------------------------------------------"
echo "Выводим баланс для стейкинга "
echo "-----------------------------------------------------------------------------"
echo "Выводим баланс для стейкинга "

#fdfdf df dfdfdfd


echo "Текущая версия: $version"
echo "-----------------------------------------------------------------------------"
echo "Общий баланс: $balance"
echo "-----------------------------------------------------------------------------"
echo "Адрес валидатора: $validator"
echo "-----------------------------------------------------------------------------"
echo "Делегировано валидатору: $stake"

