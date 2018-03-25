#!/bin/bash

mkdir /var/www -p


echo " ------------------------------------------"
echo " -------------- Repositories --------------"
echo " ------------------------------------------"
# chrome apache2 y php
sudo apt-add-repository ppa:ondrej/apache2 -y
sudo apt-add-repository ppa:ondrej/php -y
# chrome repo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ xenial main" >> /etc/apt/sources.list.d/dropbox.list'


echo " ------------------------------------------"
echo " -------------- Update Repos --------------"
echo " ------------------------------------------"
sudo apt-get update -y
sudo apt-get upgrade -y




echo " ------------------------------------------"
echo " -------------- Apache & PHP --------------"
echo " ------------------------------------------"
sudo apt-get install apache2 -y
sudo apt-get install php7.1 php7.1-cli php7.1-common php7.1-curl php7.1-xml php7.1-gd php7.1-json php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-opcache php7.1-readline php7.1-zip -y
 
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod userdir
sudo a2enmod proxy
sudo systemctl restart apache2
sudo service apache2 restart
 
cd /tmp
wget https://raw.githubusercontent.com/Viterbo/linux-files/master/index.php
sudo mv index.php /var/www/index.php
sudo chmod 775 /var/www -R
sudo chown $USER:www-data /var/www -R
wget https://raw.githubusercontent.com/Viterbo/linux-files/master/000-default.conf
sudo mv 000-default.conf /etc/apache2/sites-available/000-default.conf
sudo chmod 775 /etc/apache2/ -R
sudo chown $USER /etc/apache2/ -R

sudo systemctl restart apache2
sudo service apache2 restart


echo " ------------------------------------------"
echo " ----------- nvm & npm & bower ------------"
echo " ------------------------------------------"
cd /tmp
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
sudo chmod +x install_nvm.sh
./install_nvm.sh
source ~/.profile  #refresca la session para que vea los cambios
nvm install v7.10.1
nvm alias default v7.10.1
npm install bower -g


echo " --------------------------------------------"
echo " -------------- cordova & ionic -------------"
echo " --------------------------------------------"
npm install -g cordova ionic


echo " -----------------------------------"
echo " -------------- others -------------"
echo " -----------------------------------"
sudo apt-get purge totem -y
sudo apt-get install google-chrome-stable synaptic vlc -y


echo " ------------------------------------------"
echo " ----------- EOS dependencies -------------"
echo " ------------------------------------------"
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
sudo apt-get install clang-4.0 lldb-4.0 libclang-4.0-dev cmake make \
                     libbz2-dev libssl-dev libgmp3-dev \
                     autotools-dev build-essential \
                     libbz2-dev libicu-dev python-dev \
                     autoconf libtool git nvm libmongoc-1.0

echo " ------------------------------------------"
echo " -------------- Web Assembly --------------"
echo " ------------------------------------------"
cd
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
