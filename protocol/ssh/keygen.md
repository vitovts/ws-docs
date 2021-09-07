# --- SSH ---

# --- GENERATION KEY ---

ssh-keygen -t ed25519 -C "your_email@example.com"

# --- OR
# Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

>>
Generating public/private rsa key pair.
>>
Enter file in which to save the key (/Users/your_user/.ssh/id_rsa): Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /Users/your_user/.ssh/id_rsa.
Your public key has been saved in /Users/your_user/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:XXXXXxxxxxXXXXXxxxxxXXXX... your_email@example.com
The key's randomart image is:
+---[RSA 4096]----+
|          .   . .|
|     .   . o .E+ |
|    o = o . o+  o|
|     * o . oo.=.o|
|      o S . .Bo+.|
|       + o  = B. |
|       .B  . B   |
|       =+.= +    |
|      .+=+ =.o   |
+----[SHA256]-----+


# ---
ssh-keygen -t rsa
ssh-keygen -t rsa username
ssh-keygen -b 4096 (4096-bit RSA, default 2048)
# ---

# --- ADD >>
eval "$(ssh-agent -s)"
vim ~/.ssh/config
>>
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa

ssh-add -K ~/.ssh/id_rsa

# ---  COPY KEY REMOTE 
brew install ssh-copy-id
ssh-copy-id -i ~/.ssh/id_rsa.pub username@host

(id_rsa.pub --->>> authorized_keys remote host)

$ su - username
$ mkdir -p ~/.ssh or /home/username/.ssh and touch /home/username/.ssh/authorized_keys

$ ssh-copy-id username@remote_host

# -- OR

$ cat ~/.ssh/id_rsa.pub | pbcopy
$ vim ~/.ssh/authorized_keys - >> copy
$ chmod -R go= ~/.ssh
$ 
$ sudo vim /etc/ssh/sshd_config
  PasswordAuthentication no
$ restart sshd

$ sudo visudo 
 %sudo ALL=(ALL:ALL) NOPASSWD:ALL

# --- Delete
rm -f .ssh/known_hosts
ssh-keygen -R server-name
ex +6d -scwq ~/.ssh/known_hosts
sed -i '6d' ~/.ssh/known_hosts

Вы также можете удалить одну строку из известных хостов с помощью, например, rmknownhost 111 (111 - строка для удаления):

#! /usr/bin/env ruby
line = ARGV[0] || raise("gimme line to remove")
hosts = File.expand_path("~/.ssh/known_hosts")
content = File.readlines(hosts)
removed = content.delete_at line.to_i - 1
puts "Removed:\n#{removed}"
File.open(hosts, 'w'){|f| f.write content * ""}
Сохраните это как rmknownhostв папке из вашего PATH.



