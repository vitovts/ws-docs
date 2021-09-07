# --- Install Node.JS

## --- PreInstall
apt update -y && apt upgrade -y
apt install vim mc net-tools curl git npm build-essential -y
npm -v

## --- Installing nodejs asing a PPA
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt install nodejs -y

## --- Add user and group 

## --- Install AWS CLI





