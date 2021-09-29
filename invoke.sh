#!/bin/bash

set -x 
set -e

echo "Downloading SDN List from U.S. Treasury"
wget  https://www.treasury.gov/ofac/downloads/sanctions/1.0/sdn_advanced.xml
sleep 1

diff --brief <(sort sdn_advanced.xml) <(sort sdn.xml) >/dev/null
comp_value=$?

sleep 1
if [ $comp_value -eq 1 ]
then
    rm sdn.xml
else
    python3 ofac_crawler.py ETH -f JSON -path ./data
fi
exit 0