#!/bin/bash

validator=$(pcli query validator list | grep penumbra | awk '{ print $6 }' | head -1 | sed 's/\x1B\[[0-9;]*[mK]//g')
echo $validator > penumbra-validators.txt

#pcli query validator list > penumbra-validators.txt
