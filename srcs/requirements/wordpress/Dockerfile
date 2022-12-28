
FROM debian:buster

RUN apt update && apt install -y --no-install-recommends \
        wget php php-fpm php-mysql php-redis \
        && rm -rf /var/lib/apt/lists/* 
      
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir -p /var/www/wordpress /run/php/ \
    &&  wget --no-check-certificate -O  /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz \
    && tar -xvzf /tmp/latest.tar.gz -C /tmp/ \
    && cp -r /tmp/wordpress/. /var/www/wordpress

COPY ./conf/wp-config.php /var/www/wordpress/wp-config.php

RUN rm -rf /var/www/wordpress/wp-config-sample.php

RUN chown -R www-data:www-data /var/www/* \
    && chmod 755 -R /var/www/* 


# RUN mv wp-config-sample.php wp-config.php \
    # && 

ENTRYPOINT [ "php-fpm7.3", "-F" ]



# COPY tools/start.sh /

# RUN chmod u+x /start.sh && ./start.sh && rm /start.sh && echo "all ok" > ok.txt

# COPY conf/wp-config.php /var/www/html/wordpress/wp-config.php

# wp config
# php config
# del php-redis
# wp cli install
# conf redis