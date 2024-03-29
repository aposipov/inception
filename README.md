## inception  
:ballot_box_with_check: [Курс Stepik](https://stepik.org/course/123300/info) 
## docker 🐋
- [как устроен докефайл](https://doka.guide/tools/dockerfile/)  
- [управление данными в докер](https://doka.guide/tools/docker-data-management/)  
- [Практические рекомендации по работе с Docker для Python-разработчиков](https://habr.com/ru/company/wunderfund/blog/586778/)  
- [Как запустить веб-приложение на Nginx в Docker 🐳👨🏽‍💻](https://proglib.io/p/kak-zapustit-nginx-v-docker-2020-05-12)  
- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Docker ARG, ENV and .env - a Complete Guide](https://vsupalov.com/docker-arg-env-variable-guide/)
## docker-compose
- [Руководство по Docker Compose для начинающих](https://habr.com/ru/company/ruvds/blog/450312/)  
- [Основы Docker Compose](https://ru.hexlet.io/courses/docker-basics/lessons/docker-compose/theory_unit)  
## PID 1
- [Docker: правильный запуск процессов в контейнере с PID 1](https://it-lux.ru/docker-entrypoint-pid-1/)  
- [Проблема PID 1 zombie reaping в Докере](https://habr.com/ru/company/hexlet/blog/248519/)  
- [Dockerfile: cобираем и проверяем](http://linuxsql.ru/content/sobiraem-i-proveryaem-dockerfile-image)
## NGinx
- [Beginner’s Guide](http://nginx.org/en/docs/beginners_guide.html)  
- [Creating NGINX Plus and NGINX Configuration Files](https://docs.nginx.com/nginx/admin-guide/basic-functionality/managing-configuration-files/)
- [How to Find Your Nginx Configuration Folder](https://www.howtogeek.com/devops/how-to-find-your-nginx-configuration-folder/)
- [Самые распространенные ошибки синтаксиса Nginx](https://www.8host.com/blog/samye-rasprostranennye-oshibki-sintaksisa-nginx/)
- [Алфавитный указатель директив](https://nginx.org/ru/docs/dirindex.html)
## SSL
- [Создание самоподписанных сертификатов SSL для Apache в Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-20-04-ru)
- [Создание самоподписанного SSL-сертификата для Nginx в Ubuntu 18.04](https://www.8host.com/blog/sozdanie-samopodpisannogo-ssl-sertifikata-dlya-nginx-v-ubuntu-18-04/)
- [Самоподписанный SSL сертификат для nginx](https://og-dev.ru/articles/samopodpisannyy-ssl-sertifikat-dlya-nginx)
## MariaDB
- [Установка и настройка MySQL сервера MariaDB в виде контейнера Docker для продуктового использования](https://netpoint-dc.com/blog/ustanovka-i-nastroika-mysql-mariadb-v-vide-docker-dlya-produktovogo-ispolzovaniya/)
## php-fpm
- [Настройка PHP-FPM](https://losst.pro/nastrojka-php-fpm)
## WordPress
- [Установка WordPress на Debian 11 + Nginx](https://angald.ru/ustanovka-wordpress-na-debian-11-nginx/)
- [Установка WordPress с помощью Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose-ru)
- [Как установить WordPress на Debian 11](https://infoit.com.ua/linux/kak-ustanovit-wordpress-na-debian-11/)
- [Как установить стек LAMP на Debian 11](https://infoit.com.ua/linux/debian/kak-ustanovit-stek-lamp-na-debian-11/)
- [Развертывание Wordpress в Docker и установка его в командной строке](https://www.dmosk.ru/miniinstruktions.php?mini=wordpress-docker)
- [Установка WordPress в виде контейнера Docker в Linux](https://netpoint-dc.com/blog/ustanovka-wordpress-v-vide-kontainera-docker-v-linux/)
- [Быстрая установка и запуск WordPress в Docker с HTTPS](https://serveradmin.ru/install-wordpress-docker-https/)
## ftp
- [Как установить и настроить FTP сервер vsftpd в Debian 11](https://setiwik.ru/kak-ustanovit-i-nastroit-ftp-server-vsftpd-v-debian-11/)
- [Как установить FTP-сервер на Ubuntu](https://help.reg.ru/support/servery-vps/oblachnyye-servery/ustanovka-programmnogo-obespecheniya/kak-ustanovit-ftp-server-na-ubuntu)
## video
- [Inception 10.05.22 (meunostu, aeclipso)](https://www.youtube.com/watch?v=Veuv7MjaIKQ)
- [Лекция по docker compose (inception)](https://www.youtube.com/watch?v=RuTp0US9IgY)
- [Основы Nginx > Playlist](https://www.youtube.com/watch?v=dHsv8EnhSgQ&list=PLhgRAQ8BwWFa7ulOkX0qi5UfVizGD_-Rc&index=1)
- [Nginx > Playlist](https://www.youtube.com/playlist?list=PLc7C4rck3fYswuRgp9pI3NsAxehJwcNFD)
- [NGINX с нуля до профи. Nginx что это, как работает, как парсит конфиги?](https://www.youtube.com/watch?v=ixfnxLqcLOs)
- [Настройка nginx wordpress php-fpm. Nginx или apache для wordpress? Почему nginx?](https://www.youtube.com/watch?v=VF3VvP9v0Y8)
- [Веб-сервер на реальном примере. Docker-compose, nginx, mysql, php-fpm, wordpress](https://www.youtube.com/watch?v=mKdwkV5p1xg&t=273s)
- [1. Настройка Docker. PHP+Nginx+MySQL](https://www.youtube.com/watch?v=9e_FH3bDHBc)  
- [2. Настройка Docker. MySQL контейнер, установка соединениея из PHP](https://www.youtube.com/watch?v=IfakKN4Ub-8)
##
[Команда SED в Linux/Unix с примерами](https://habr.com/ru/company/ruvds/blog/667490/)  
[sed, a stream editor](https://www.gnu.org/software/sed/manual/sed.html)
## commands
`docker run -it -v "$(pwd)":/tmp_test <image_name> /bin/bash`
```
sudo apt update && apt upgrade -y && apt install -y vim make git
```
```
sudo apt install -y docker docker-compose && sudo usermod -aG docker $USER 
```
docker install
```
mkdir -p /home/${USER}/data/db
mkdir -p /home/${USER}/data/wp
```
transfer files ssh  
```
scp ~/test.txt user@host:documents
```
```
scp  -P 4242 -r ./dir_name lchristi@localhost:/home/lchristi/
```
```
tar czf - /home/user/file | ssh user@host tar -xvzf -C /home/remoteuser/
```
Debian apt install  `--no-install-recommends` `nocache` `&& rm -rf /var/lib/apt/lists/*`  
In addition, when you clean up the apt cache by removing /var/lib/apt/lists it reduces the image size, since the apt cache is not stored in a layer. Since the RUN statement starts with apt-get update, the package cache is always refreshed prior to apt-get install.
## github
https://github.com/codesshaman/inception  
https://github.com/luta-wolf/inception  
https://github.com/rbiodies/Inception  
