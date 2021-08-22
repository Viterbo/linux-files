# How to install Docker in ubuntu 20.04

### assert basics are installed

    sudo apt update
    sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

### GPG key & repo

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt-get install docker-ce docker-ce-cli containerd.io

### Install Docker & verify

    // List available versions
    apt-cache madison docker-ce
    // check local OS version
    cat /etc/lsb-release
    
    // sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
    sudo apt-get install docker-ce=5:20.10.8~3-0~ubuntu-focal docker-ce-cli=5:20.10.8~3-0~ubuntu-focal containerd.io
    
    systemctl status docker
    
### Testing installation
    
    sudo docker run hello-world

### Add user to docker group (to avoid the need for 'sudo')

    sudo usermod -aG docker ${USER}
    su - ${USER}

### verify user is in docker group

    id -nG


### tutorial source

https://docs.docker.com/engine/install/ubuntu/
