#!/bin/bash

validator=$(pcli query validator list | grep penumbra | awk '{ print $6 }' | head -1 | sed 's/\x1b\[[0-9;]*[mG]//g') > penumbra-validators.txt
#echo $validator > penumbra-validators.txt

#pcli query validator list > penumbra-validators.txt
