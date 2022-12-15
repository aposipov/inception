
FROM debian:buster

ARG PHP_VERSION=8

RUN apt update && apt install -y \
        --no-install-recommends \
        wget \
        php php-fpm\
        # php${PHP_VERSION}-fpm \
        # php${PHP_VERSION}-mysqli \
        # php${PHP_VERSION}-json \
        # php${PHP_VERSION}-curl \
        # php${PHP_VERSION}-dom \
        # php${PHP_VERSION}-exif \
        # php${PHP_VERSION}-fileinfo \
        # php${PHP_VERSION}-mbstring \
        # php${PHP_VERSION}-openssl \
        # php${PHP_VERSION}-xml \
        # php${PHP_VERSION}-zip \
        # php${PHP_VERSION}-redis \
        && rm -rf /var/lib/apt/lists/* 

COPY tools/start.sh /


RUN chmod u+x /start.sh && ./start.sh && rm /start.sh && echo "all ok" > ok.txt

COPY conf/wp-config.php /var/www/html/wordpress/wp-config.php

# wp config
# php config