# --- Install on PVE CLoud-init
apt-get install cloud-init

## --- PreInstall 
ssh root@pve
mkdir /usr/src/cloud-init && cd /usr/src/cloud-init

### --- Ubuntu 20.04 LTS --- 10001
wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img
#### create a new VM
qm create 10001 --memory 2048 --net0 virtio,bridge=vmbr0 --name focal
#### import the downloaded disk to local-lvm storage
qm importdisk 10001 focal-server-cloudimg-amd64.img local-lvm
#### finally attach the new disk to the VM as scsi drive
qm set 10001 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-10001-disk-0 --ide2 local-lvm:cloudinit --boot c --bootdisk scsi0 --serial0 socket --vga serial0 --agent 1



### --- Ubuntu 18.04 LTS --- 10002
wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img
#### create a new VM
qm create 10002 --memory 2048 --net0 virtio,bridge=vmbr0 --name bionic
#### import the downloaded disk to local-lvm storage
qm importdisk 10002 bionic-server-cloudimg-amd64.img local-lvm
> uccessfully imported disk as 'unused0:OMV1:10001/vm-10001-disk-0.raw'
#### finally attach the new disk to the VM as scsi drive
qm set 10002 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-10002-disk-0 --ide2 local-lvm:cloudinit --boot c --bootdisk scsi0 --serial0 socket --vga serial0 --agent 1


### --- Configure
vim /etc/cloud/cloud.cfg


#### --- add user --- 
sudo groupadd --gid 10000 user
sudo useradd -s /bin/bash -d /home/user/ -m --uid 10000 user
#### add usr in group docker
sudo usermod -aG sudo user
#### visudo
user  ALL=(ALL:ALL) NOPASSWD:ALL

#### UFW
apt remove ufw*