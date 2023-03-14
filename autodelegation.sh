#!/bin/bash

validator=$(pcli query validator list | grep penumbra | awk '{ print $6 }' | sed 's/\x1b\[[0-9;]*[mG]//g' | head -1) > penumbra-validators.txt
#echo $validator

#pcli query validator list > penumbra-validators.txt
