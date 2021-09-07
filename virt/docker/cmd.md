# --- Docker commands

# Удалить всё что не используется
docker system prune -a -f

# --- docker version
docker info

# --- test
docker run hello-world
docker run - -rm hello-world
docker container run - -rm hello-world

# --- IMAGES
docker images
docker image rm [-f] <name>

# --- DockerHub
# --- tomacat
docker pull tomcat
docker pull tomcat:8.5.38
docker run -it tomcat:8.5.38
docker run -d tomcat:8.5.38


# --- CONTAINER
# --- удалить все контейнеры
docker rm -f $(docker ps -aq)
# --- CONTAINER INFO
```
docker ps <options>
docker container ls <options>
--->>>
CONTAINER ID 	— идентификатор контейнера
IMAGE 				— образ на основании которого был создан контейнер
COMMAND 			— команда которая используется как основной процесс
CREATED 			— время когда был создан контейнер
STATUS 				— статус контейнера (запащен, на пазуе, остановлен с ошибкой и т.д.)
PORTS 				— внутренние порты и мапинг портов
NAMES 				— имя контейнера
```   
# --- CREATE CONTAINER
docker create <options> <image name:tag>
docker container create <options> <image name:tag>
# ---  START CONTAINER
docker start <container name> or <hash>
docker container start <container name> or <hash>
# --- REMOVE CONTAINER
docker rm <options> <container name> or <hash>
docker container rm <options> <container name> or <hash>
# --- STOP CONTAINER 
docker stop <container name> or <hash>
docker container stop <container name> or <hash>
# --- PAUSE CONTAINER
docker pause <container name> or <hash>
docker container pause <container name> or <hash>
# --- UNPAUSE CONTAINER 
docker unpause <container name> or <hash>
docker container unpause <container name> or <hash>
# --- INSPECT CONTAINER 
docker inspect <container name> or <hash>
docker container inspect <container name> or <hash>
# --- CONTAINER PROCESSES
docker top <container name> or <hash>
docker container top <container name> or <hash>
# --- CONTAINERS STATS
docker stats
docker container stats





# --- VOLUME
# LIFETIME & VOLUMES
# Bind mount — файл или директория на диске host системы.
# Docker volume — механизм для постоянного сохранения данных генерируемых и используемых контейнером.
# TMPFS — механизм для временного сохранения данных генерируемых и используемых контейнером в оперативной памяти host системы.
# --- DOCKER VOLUME CMD
create
inspect
ls
prune
rm
# --- DOCKERFILE VOLUME
FROM nginx:alpine
VOLUME /usr/share/nginx/html



# Удалить всё что не используется
docker system prune -a -f



# Получаем подробную информацию про образ
docker image inspect fholzer/nginx-brotli --format "{{.Config.Env}}"

# Получаем подробную информацию про слои
docker image history --no-trunc fholzer/nginx-brotli

# Info for map volume
docker image inspect mongo --format "{{.Config.Volumes}}"

# Создаём Volume
docker volume create --driver local \
    --opt type=tmpfs \
    --opt device=tmpfs \
    --opt o=size=100m \

#
docker container run -d --mount source=storage,target=/usr/share/nginx/html --name webhost nginx:alpine   

#
docker container run -d \
    --mount type=bind,source="$(pwd)"/html,target=/usr/share/nginx/html,readonly \
    --publish 80:80 \
    --name webhost nginx:alpine

$(pwd) - work dir

#
docker container run -d \
    --mount type=bind,source="$(pwd)"/index.html,target=/usr/share/nginx/html/index.html \
    --mount type=bind,source="$(pwd)"/about.html,target=/usr/share/nginx/html/about.html \
    --publish 80:80 \
    --name webhost nginx:alpine
    
    
#

