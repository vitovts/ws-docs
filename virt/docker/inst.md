# --- Introduction to Docker

## --- Install ---

### --- on Ubuntu ---

#### --- v1 ---
sudo curl -sSL https://get.docker.com/ | CHANNEL=stable sh
<OR>
sudo curl https://get.docker.com/ | bash

#### --- v2 ---
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
sudo systemctl status docker
sudo usermod -aG docker $USER
>>>logout/login<<<
##### ---
docker run hello-world

### --- Install Docker Compose ---
su -
curl -L https://github.com/docker/compose/releases/download/$(curl -Ls https://www.servercow.de/docker-compose/latest.php)/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


### --- add user --- 
groupadd --gid 10000 $USER
useradd -s /bin/bash -d /home/$USER/ -m --uid 10000 --gid 10000 -G sudo $USER
#### add usr in group docker
sudo usermod -aG docker $USER
