# How to install Docker in ubuntu 18.04

### assert basics are installed

    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

### GPG key & repo

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt update
    apt-cache policy docker-ce

### Install Docker & verify

    sudo apt install docker-ce -y
    systemctl status docker

### Add user to docker group (to avoid the need for 'sudo')

    sudo usermod -aG docker ${USER}
    su - ${USER}

### verify user is in docker group

    id -nG


### tutorial source

https://www.digitalocean.com/community/tutorials/como-instalar-y-usar-docker-en-ubuntu-18-04-1-es


