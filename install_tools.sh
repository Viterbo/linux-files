sudo apt-add-repository ppa:ondrej/apache2 -y
sudo apt-add-repository ppa:ondrej/php -y
 
# repo for visual studio code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
 
#dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ xenial main" >> /etc/apt/sources.list.d/dropbox.list'

#ethereum
sudo add-apt-repository -y ppa:ethereum/ethereum -y



# chrome repo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

sudo apt-get update -y
sudo apt-get upgrade -y
 
# --------------
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

# nvm & npm & bower
cd /tmp
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
sudo chmod +x install_nvm.sh
./install_nvm.sh
source ~/.profile  #refresca la session para que vea los cambios
nvm install v7.0.0
npm install bower -g

#ethereum
sudo apt-get install mist ethereum software-properties-common -y
cd /tmp
wget https://github.com/ethereum/mist/releases/download/v0.9.3/Ethereum-Wallet-linux64-0-9-3.deb
sudo dpkg -i Ethereum-Wallet-linux64-0-9-3.deb

# phpmyadmin & mysql
sudo apt-get install mysql-server phpmyadmin -y

# visual studio code, dropbox, chome
sudo apt-get install code dropbox google-chrome-stable
dropbox start -i




