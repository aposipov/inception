
FROM debian:buster

RUN apt update && apt install -y --no-install-recommends \
        wget php7.3 php-fpm php-mysql php-curl php-redis mariadb-client procps &&\
        rm -rf /var/lib/apt/lists/* &&\ 
        mkdir -p /run/php/ /var/www/

RUN wget --no-check-certificate -O /usr/local/bin/wp \
        https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
        chmod +x ./usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh

ENTRYPOINT [ "./tmp/setup.sh" ] 