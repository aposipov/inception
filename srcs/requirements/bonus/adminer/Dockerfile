
FROM debian:buster

RUN apt update && apt install -y --no-install-recommends \
        wget php php-mysql\
        && rm -rf /var/lib/apt/lists/* \
        && mkdir -p var/www/ \
        &&  wget --no-check-certificate -O  /var/www/index.php \
        https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

# ENTRYPOINT [ "php", "-S", "[::]:8080", "-t", "/var/www/" ]

CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www" ]