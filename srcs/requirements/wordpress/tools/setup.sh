#!/bin/bash
echo "***START SETUP WP***"
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
if [ ! -f /var/www/wordpress/wp-config.php ]; then
wp core download --allow-root --path="/var//www/wordpress/"
wp config create --allow-root --path="/var//www/wordpress/"\
                --dbname=$DB_NAME\
                --dbuser=$DB_USER\
                --dbpass=$DB_PASS\
                --dbhost=$DB_HOST\
                --dbprefix=wp_
wp core install --allow-root --path="/var//www/wordpress/"\
                --url=$DOMAIN_NAME\
                --title=$WP_TITLE\
                --admin_user=$WP_AUSER\
                --admin_password=$WP_APASS\
                --admin_email=$WP_AMAIL\
                --skip-email
wp user create --allow-root --path="/var//www/wordpress/"\
                $WP_USER $WP_UMAIL\
                --role=$WP_UROLE\
                --user_pass=$WP_PASS
# wp config set --allow-root --path="/var//www/wordpress/" WP_MEMORY_LIMIT 256M
wp config set --allow-root --path="/var//www/wordpress/" WP_REDIS_HOST redis
wp config set --allow-root --path="/var//www/wordpress/" WP_REDIS_PORT 6379 --raw
wp config set --allow-root --path="/var//www/wordpress/" WP_REDIS_DATABASE 0 --raw
wp config set --allow-root --path="/var//www/wordpress/" WP_CACHE true --raw
fi
echo "***START PHP_FPM***"
exec /usr/sbin/php-fpm7.3 -F