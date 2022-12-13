
FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y\
        nocache --no-install-recommends\
        nginx openssl 

# RUN apt install -y procps htop


COPY tools/ /var/www/html/
# COPY conf/my_nginx.conf /etc/nginx/

CMD ["nginx", "-g", "daemon off;"]

# ssl certif