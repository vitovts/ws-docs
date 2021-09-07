Android-SDK

# --- Ubuntu ---

apt update -y
apt upgrade -y
dpkg-reconfigure tzdata 
java --version
apt install software-properties-common
apt install openjdk-11-jre openjdk-8-jre gnupg gnupg[12] -y
add-apt-repository ppa:openjdk-r/ppa
apt install openjdk-8-jdk-headless
apt install android-sdk adb

java --version
mkdir android

mkdir /home/workspace# 


wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip
wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
unzip commandlinetools-linux-6609375_latest.zip -d cmdline-tools
cp .... usr/lib/android-sdk/cmdline-tools/ ....
!!!!! /usr/lib/android-sdk/cmdline-tools/tools/bin/

echo $PATH
vim .bashrc
export ANDROID_HOME=/usr/lib/android-sdk
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH
???source ~/.bash_profile

??? >>> :/usr/lib/android-sdk:/usr/lib/android-sdk/cmdline-tools/tools/bin:

sdkmanager --version
yes | sdkmanager --licenses

yes | sdkmanager --update

adb --version 

chown -R $(whoami) /usr/lib/android-sdk
chmod 777 /usr/lib/android-sdk  

## sdkmanager "platform-tools" "platforms;android-31"
for i in {1..33} ; do sdkmanager "platform-tools" "platforms;android-${i}"; done
## sdkmanager "platform-tools" "build-tools;30.0.2”
for i in {1..31} ; do sdkmanager "platform-tools" "build-tools;${i}.0.1"; done
for i in {1..31} ; do sdkmanager "platform-tools" "build-tools;${i}.0.2"; done
for i in {1..31} ; do sdkmanager "platform-tools" "build-tools;${i}.0.3"; done
for i in {1..31} ; do sdkmanager "platform-tools" "build-tools;${i}.0.4"; done



136  du android-sdk/
  137  du android-sdk/find <dir> -ls | awk '{sum += $7} END {print sum}'
  138  find <android-sdk> -ls | awk '{sum += $7} END {print sum}'
  139  find <android-sdk/> -ls | awk '{sum += $7} END {print sum}'
  
mkdir IKAWA
cd IKAWA/
  154  scp file.txt root@dev2.cogniteq.com:




   83  sudo wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
   84  mkdir android-sdk
   85  ls
   86  unzip commandlinetools-linux-6858069_latest.zip -d android-sdk
   87  ls
   88  cd android-sdk

  103  sudo wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
  104  mkdir android-sdk
  105  unzip commandlinetools-linux-6858069_latest.zip -d android-sdk
  106  ls
 
  109  nano /etc/enviroviment
  110  nano ./environment
  111  cd ..

  122  echo $PATH
  123  yes |sudo -iu jenkins /var/android-sdk/cmdline-tools/bin/sdkmanager --licenses
  124  yes |sudo -iu jenkins /var/android-sdk/cmdline-tools/bin/sdkmanager --licenses --sdk_root=/var/android-sd
  125  echo $PATH

  163  yes | /var/android-sdk/cmdline-tools/bin/sdkmanager --licenses --sdk_root=/var/android-sdk/cmdline-tools/latest
  164  yes | /var/android-sdk/cmdline-tools/bin/sdkmanager --licenses --sdk_root=/var/android-sdk
  

  169  ls
  170  cd android-sdk
  171  yes | /var/android-sdk/cmdline-tools/bin/sdkmanager --licenses --sdk_root=/var/android-sdk
  172  sudo chmod -R 777 /var/android-sdk




