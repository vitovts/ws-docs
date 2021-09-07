DOCKER
Docker — программное обеспечение для автоматизации развёртывания и управления приложениями в средах с поддержкой контейнеризации.

Virtual Machines предоставляют нам hardware level virtualization
Docker Containers предоставляют operating system level virtualization

Изначально Docker использовал LinuX Containers (LXC)
Сейчас Docker использует runC (известный как libcontainer)

Отличие:
- VM: состоит из приложения, связанных библиотек и исходного кода и отдельной ОС. 
- Каждая виртуальная машина получает часть ОЗУ и ЦП хост-машины.
- Docker Container: получает своё собственное изолированное пространство, 
- которое содержит само приложение и относящийся к нему исходный код.


ПРОИСХОЖДЕНИЕ:
```
Первый релиз был опубликован 13 марта 2013 года # Автор — Соломоном Хайксом (Solomon Hykes)
Соавторы — Андреа Лудзарди (Andrea Luzzardi) и Франсуа-Ксавье Бурле (François- Xavier Bourlet).
```

ОСОБЕННОСТИ:
```
Open-source 
Enterprise
Cross-platform
Написан на Go
```

ОБЛАСТИ ПРИМЕНЕНИЯ:
```
Контейнеризация Web приложений 
Построение отказоустойчивых систем 
Kubernetes
Тестирование Web приложений
CI/CD
```

ПОПУЛЯРНОСТЬ 
```
Большие возможности
Возможность предоставить заказчику готовый продукт 
Огромное комьюнити
Низкий порог входа
Малое потребление ресурсов
Используют миллионы людей во всём мире
Огромное количество готовых Docker образов
```

УСТАНОВКА: 
- WINDOWS
```
Windows 10 64bit: Pro, Enterprise or Education (1607 Update, Build 14393 or later) 
Virtualization is enabled in BIOS.
CPU SLAT-capable feature
At least 4GB of RAM.
```
- MACOS
```
Mac hardware must be a 2010 or newer model
macOS Sierra 10.12+
VirtualBox prior to version 4.3.30+ (optional) 
At least 4GB of RAM.
```
- UBUNTU 
```
Linux kernel version 3.10 or higher 
512+ Mb of RAM.
```

Docker Engine — легковесная среда выполнения, которая управляет образами, контейнерами, сборками образов и т.д.

Docker Daemon — демон выполняет команды которые были отправлены клиентом docker. Сборка образов, запуск контейнеров и т.д.

Dockerfile — файл с набором инструкций который используется для сборки образов (docker image).

Docker Image — файл состоящий из множества слоёв, который используется для выполнения кода в докер контейнерах. Read-only template.

Union File Systems — своего рода объединяемая (stackable) файловая система, которая содержит файлы и каталоги разных файловых систем. 
Они прозрачно накладываются друг на друга, образуя единую файловую систему.

Docker Volumes — часть данных контейнеров которые ссылаются на внешние носители. 
Перзистентно сохранять данные внутри контейнеров можно только при наличии docker volumes.

Docker Container — это стандартная единица программного обеспечения, которая упаковывает код и все его зависимости. 
Контейнеры создаются на основе docker image (образов).

Help
```
docker --help
docker docker-subcommand --help
```

ОСНОВНЫЕ КОМАНДЫ
```
attach 
build 
commit 
cp 
create 
diff 
events 
exec 
export 
history 
images
import 
pull 
stop 
info 
push 
tag 
inspect 
rename 
top
kill 
restart 
unpause 
load 
rm 
update 
login 
rmi 
version 
logout 
run 
wait 
logs 
save
pause 
search 
port 
start 
ps 
stats
```
   

```



docker create <options> <image name:tag>
docker container create <options> <image name:tag>
   

  

```
docker system prune -a -f
```
