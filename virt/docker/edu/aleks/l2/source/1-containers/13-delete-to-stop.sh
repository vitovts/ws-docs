#!/bin/bash
# удалить предыдущий контейнер
docker rm -f proxy

# Создаём и запускаем nginx контейнер
# 1. В фоновом режиме
# 2. Мапим порт к host машине
# 3. Устанавливаем имя контейнера
# 4. Удаляем контейнер после его остановки
docker container run --rm -d -p 80:80 --name proxy nginx
