#!/bin/bash

version=$(pcli -V | awk '{ print $1 }' | tr -d 'pcli')
echo $version


