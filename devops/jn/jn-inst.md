apt install  python3-pip zip curl vim mc git net-tools openjdk-8-jre gnupg gnupg1

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins


# --- jnws-m1 ---
pwd
/var/lib/jenkins
ssh-keygen -t rsa -b 4096 -C “jnws-m1”
ls -la .ssh
vim .ssh/authorized_keys 
usermod -aG sudo jenkins 
visudo
jenkins ALL=(ALL:ALL) NOPASSWD: ALL

# --- jnws-n1 --- 
# --- ub1804 ---
ansible-playbook play/pve-lxc-ub1804.yaml --ask-vault-password
ansible-playbook play/ub-common.yaml


# --- adduser jenkins
useradd -d /var/lib/jenkins -m -s /bin/bash -G sudo -c "jnws-n1" jenkins
mkdir /var/lib/jenkins/.ssh
vim /var/lib/jenkins/.ssh/authorized_keys 

# --- android-sdk ---
apt update -y && apt upgrade -y
dpkg-reconfigure tzdata 
java -version
apt install software-properties-common
apt install openjdk-11-jre openjdk-8-jre gnupg gnupg[12] -y

add-apt-repository ppa:openjdk-r/ppa

apt install openjdk-8-jdk-headless
apt install android-sdk adb

java --version
adb --version 

echo $PATH
export ANDROID_HOME=/usr/lib/android-sdk
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH
echo $PATH

wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
unzip commandlinetools-linux-6858069_latest.zip -d /usr/lib/android-sdk/cmdline-tools
mv /usr/lib/android-sdk/cmdline-tools/cmdline-tools/ /usr/lib/android-sdk/cmdline-tools/tools/ 
rm -r /usr/lib/android-sdk/build-tools/27.0.1

yes | sdkmanager --licenses
sdkmanager --version
yes | sdkmanager --update

vim ~/.bashrc
export ANDROID_HOME=/usr/lib/android-sdk
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH

[sdkmanager "platform-tools" "platforms;android-1”]
[sdkmanager "platform-tools" "build-tools;29.0.2"]

for i in {1..33} ; do sdkmanager "platform-tools" "platforms;android-${i}"; done
for i in {1..31} ; do sdkmanager "platform-tools" "build-tools;${i}.0.1"; done
for i in {1..31} ; do sdkmanager "platform-tools" "build-tools;${i}.0.2"; done
for i in {1..31} ; do sdkmanager "platform-tools" "build-tools;${i}.0.3"; done
for i in {1..31} ; do sdkmanager "platform-tools" "build-tools;${i}.0.4"; done
for i in range(23,31); do sdkmanager "platform-tools" "build-tools;${i}.0.4"; done

chown -R $(whoami) $ANDROID_HOME
chmod 777 /usr/lib/android-sdk  

chmod -R 755 /var/lib/jenkins/



    - shell: echo PATH is $PATH
      environment:
        PATH: $ANDROID_HOME/cmdline-tools/tools/bin
      register: shellout
    - debug: var=shellout

    - name: add path 
      shell: export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH
      register: PATH
    - debug: var=PATH

    - name: Set ANDROID_HOME
      lineinfile:
        dest: /etc/environment
        state: present
        regexp: 'PATH=ANDROID_HOME'
        line: 'ANDROID_HOME=/usr/lib/android-sdk'


