#!/bin/bash

# Выводит первого активного валидатора из списка
validator=$(pcli query validator list | grep penumbra | awk '{ print $6 }' | head -1)
echo $validator
