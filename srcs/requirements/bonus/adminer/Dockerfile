
FROM debian:buster

RUN apt update && apt install -y --no-install-recommends \
        wget php7.3 php-fpm php-mysql\
        && rm -rf /var/lib/apt/lists/* \
        && mkdir -p var/www/ \
        &&  wget --no-check-certificate -O  /var/www/index.php \
        https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

# ENTRYPOINT [ "php", "-S", "[::]:8080", "-t", "/var/www/" ]

# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/ 
# RUN mkdir /run/php/

# RUN chown -R www-data:www-data /var/www \
    # && chmod 755 -R /var/www 

CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www" ]

# CMD [ "php-fpm7.3", "-F"]