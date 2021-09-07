apt-get -y update && apt-get -y upgrade
apt install -y mc vim net-tools

URL https://pve.proxmox.com/wiki/Package_Repositories#sysadmin_enterprise_repo

vim /etc/apt/sources.list.d/pve-enterprise.list

#deb https://enterprise.proxmox.com/debian/pve buster pve-enterprise
deb http://download.proxmox.com/debian/pve buster pve-no-subscription

