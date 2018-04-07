#!/bin/bash

echo " ------------------------------------------"
echo " -------- Clonating EOS repo --------------"
echo " ------------------------------------------"
mkdir -p /var/www
cd /var/www
git clone https://github.com/EOSIO/eos.git --recursive

echo " ------------------------------------------"
echo " ----- Running Docker EOS Container -------"
echo " ------------------------------------------"
cd eos/Docker
docker build . -t eosio/eos
