#!/bin/bash


echo " ------------------------------------------"
echo " ----------- apt-get update ---------------"
echo " ------------------------------------------"
sudo apt-get update -y

echo " ------------------------------------------"
echo " ----------- dependencies   ---------------"
echo " ------------------------------------------"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y


echo " ------------------------------------------"
echo " ------ Docker’s official GPG key ---------"
echo " ------------------------------------------"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo " ------------------------------------------"
echo " ------------ Verification ----------------"
echo " ------------------------------------------"
sudo apt-key fingerprint 0EBFCD88


echo " ------------------------------------------"
echo " ------------ Add Repository --------------"
echo " ------------------------------------------"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo " ------------------------------------------"
echo " ----------- apt-get update ---------------"
echo " ------------------------------------------"
sudo apt-get update -y


echo " ------------------------------------------"
echo " ----------- Install Docker ---------------"
echo " ------------------------------------------"
sudo apt-get install docker-ce -y

echo " ------------------------------------------"
echo " ------- Install Docker Compose -----------"
echo " ------------------------------------------"
sudo touch /usr/bin/docker-compose
sudo chmod 777 /usr/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.11.1/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
docker-compose --version

echo " ------------------------------------------"
echo " -------- Runing Hello-World --------------"
echo " ------------------------------------------"
sudo docker run hello-world

