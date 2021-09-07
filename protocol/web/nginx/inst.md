# --- Install NGINX


## --- Ubuntu
### --- Preinstall
sudo apt install curl gnupg2 ca-certificates lsb-release ubuntu-archive-keyring

#### --- key
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

#### --- check
gpg --dry-run --quiet --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

Вывод команды должен содержать полный отпечаток ключа 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62:

pub   rsa2048 2011-08-19 [SC] [expires: 2024-06-14]
uid   [ unknown] nginx signing key <signing-key@nginx.com>
      573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
uid                      nginx signing key <signing-key@nginx.com>

Если отпечаток отличается от вышеуказанного, удалите файл ключа.

#### apt-репозитория для стабильной версии nginx:
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list

### использовать пакеты для основной версии nginx:
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/mainline/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list

### --- Install
sudo apt update
sudo apt install nginx



