# How to install VirtualBOX 6.1 in ubuntu 18.04

### assert basics are installed

    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

### Setup Apt Repository

    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"

### Install VirtualBox on Ubuntu 18.04

    sudo apt install virtualbox-6.1 -y

### Launch VirtualBox

    virtualbox


### tutorial source

https://tecadmin.net/install-virtualbox-on-ubuntu-18-04/


