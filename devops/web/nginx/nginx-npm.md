NPM

# --- Install ---
apt update
apt upgrade

install net-tools
install docker.io -y
install docker-compose

systemctl enable docker
systemctl start docker 
systemctl status docker

vim config.json 
<EOF>
{
  "database": {
    "engine": "mysql",
    "host": "db",
    "name": "npm",
    "user": "npm",
    "password": "npm",
    "port": 3306
  }
} 
EOF

vim docker-compose.yml 
<EOF>
version: '3'
services:
  app:
    restart: always
    image: 'jc21/nginx-proxy-manager:latest'
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - ./config.json:/app/config/production.json
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
  db:
    restart: always
    image: 'yobasystems/alpine-mariadb'
    environment:
      MYSQL_ROOT_PASSWORD: 'npm'
      MYSQL_DATABASE: 'npm'
      MYSQL_USER: 'npm'
      MYSQL_PASSWORD: 'npm'
    volumes:
      - ./data/mysql:/var/lib/mysql 
EOF

В отличии от оригинальной инструкции использую DB image – yobasystems/alpine-mariadb (более стабильная работа) 
добавил пункт restart: always для автоматического запуска при включении LXC

docker-compose up -d 

http://ip:81
Default> 
Email: admin@example.com
Password: changeme










