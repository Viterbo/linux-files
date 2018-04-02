#!/bin/bash

echo " ------------------------------------------"
echo " ----------- apt-get update ---------------"
echo " ------------------------------------------"
sudo apt-get update -y

echo " ------------------------------------------"
echo " ----------- EOS dependencies -------------"
echo " ------------------------------------------"
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
sudo apt-get install clang-4.0 lldb-4.0 libclang-4.0-dev cmake make \
                     libbz2-dev libssl-dev libgmp3-dev \
                     autotools-dev build-essential \
                     libbz2-dev libicu-dev python-dev \
                     autoconf libtool git libmongoc-1.0 -y

echo " ------------------------------------------"
echo " -------------- Web Assembly --------------"
echo " ------------------------------------------"
cd
sudo apt-get install git -y
git clone https://github.com/WebAssembly/binaryen
cd binaryen
cmake .
make

echo " --------------------------------------------"
echo " ------------------ eosjs -------------------"
echo " --------------------------------------------"
# https://github.com/EOSIO/eosjs

cd /var/www
git clone https://github.com/EOSIO/eosjs.git
cd eosjs
npm install
npm run build
# builds: ./dist/eos.js

echo " --------------------------------------------"
echo " ------------------ eos ---------------------"
echo " --------------------------------------------"
# https://github.com/EOSIO/eos
# local testnet
cd /var/www
git clone https://github.com/eosio/eos --recursive
cd eos
./eosio_build.sh ubuntu full
