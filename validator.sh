#!/bin/bash

version=$(pcli -V | awk '{ print $NF }')
echo $version


