## --- Add user and group 
groupadd --gid 10000 user
useradd -s /bin/bash -d /home/user/ -m --uid 10000 --gid 10000 -G sudo user

chown user:user /home/user/

mkdir /home/user/.ssh
vim /home/user/.ssh/authorized_keys

chown user:user /home/user/.ssh
chown user:user /home/user/.ssh/*