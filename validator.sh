#!/bin/bash

version=$(pcli -V | awk '{ print $1 }')
echo $version


