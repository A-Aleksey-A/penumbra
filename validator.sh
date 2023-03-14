#!/bin/bash

version=$(pcli -V | awk '{ print $2 }')
echo $version


