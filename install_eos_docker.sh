#!/bin/bash

echo " ------------------------------------------"
echo " -------- Clonating EOS repo --------------"
echo " ------------------------------------------"
sudo mkdir -p /var/www
cd /var/www
git clone https://github.com/EOSIO/eos.git --recursive

echo " ------------------------------------------"
echo " ----- Building Docker EOS Container ------"
echo " ------------------------------------------"
cd eos/Docker
docker build . -t eosio/eos

echo " ------------------------------------------"
echo " ----- IF ERROR: permision denied ---------"
echo " ------------------------------------------"
echo "type:"
echo "   sudo usermod -a -G docker $USER"
echo "then reboot"
echo "finally login and type:"
echo "   /var/www/eos/install.sh"
echo " "
echo "#!/bin/bash" > /var/www/eos/install.sh
echo "cd /var/www/eos/Docker" >> /var/www/eos/install.sh
echo "docker build . -t eosio/eos" >> /var/www/eos/install.sh
echo "echo \"to start the nodes type:\"" >> /var/www/eos/install.sh
echo "echo \"   cd /var/www/eos/" >> /var/www/eos/install.sh
echo "echo \"   docker volume create --name=nodeos-data-volume\"" >> /var/www/eos/install.sh
echo "echo \"   docker volume create --name=keosd-data-volume\"" >> /var/www/eos/install.sh
echo "echo \"   docker-compose up\"" >> /var/www/eos/install.sh
sudo chmod +x /var/www/eos/install.sh





