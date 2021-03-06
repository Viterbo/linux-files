#!/bin/bash


echo " ------------------------------------------"
echo " -------------- Repositories --------------"
echo " ------------------------------------------"

# apache2 y php
sudo apt-add-repository ppa:ondrej/apache2 -y
sudo apt-add-repository ppa:ondrej/php -y

# chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ xenial main" >> /etc/apt/sources.list.d/dropbox.list'

# repo for visual studio code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Multiconterter
sudo add-apt-repository ppa:cteehayder/ffmulticonverter

echo " ------------------------------------------"
echo " -------------- Update Repos --------------"
echo " ------------------------------------------"
sudo apt-get update -y

echo " ------------------------------------------"
echo " ----------- Upgrade packages -------------"
echo " ------------------------------------------"
sudo apt-get upgrade -y

echo " ------------------------------------------"
echo " -------------- Basics --------------------"
echo " ------------------------------------------"
sudo apt-get install git curl synaptic -y
sudo apt-get install apt-transport-https ca-certificates software-properties-common -y


echo " ------------------------------------------"
echo " -------------- Docker --------------------"
echo " ------------------------------------------"
#Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install docker-ce -y

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
echo " -------- phpMyAdmin & MySQL --------------"
echo " ------------------------------------------"
sudo apt-get install phpmyadmin mysql-server -y
 


echo " -----------------------------------"
echo " -------------- others -------------"
echo " -----------------------------------"
sudo apt-get purge totem -y
sudo apt-get install git curl gimp google-chrome-stable synaptic vlc openssh-server -y
sudo apt-get install code
# sudo apt install gtk-recordmydesktop ffmpeg ffmulticonverter -y
sudo apt-get install alien dpkg-dev debhelper build-essential -y

echo " ------------------------------------------"
echo " ----------- nvm & npm & bower ------------"
echo " ------------------------------------------"
cd /tmp
sudo apt-get install curl -y
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
sudo chmod +x install_nvm.sh
./install_nvm.sh

echo " ------- "
echo "open other terminal and type:"
echo "nvm install v9.11.2"
echo "nvm alias default v9.11.2"
echo "npm install bower ionic cordova @angular/cli@latest -g"
echo " ------- "
echo "if you wanna install eos type:"
echo "wget https://raw.githubusercontent.com/Viterbo/linux-files/master/install_eos.sh"
echo "sudo chmod +x install_eos.sh"
echo "./install_eos.sh"
echo "tendria que incorporar esto para poder grabar la salida standard"
echo "https://askubuntu.com/a/229365/820780"




