FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y\
        nocache --no-install-recommends\
        nginx openssl procps htop

COPY conf/inception.conf /etc/nginx/sites-available

CMD ["nginx", "-g", "daemon off;"]

#ssl certif