#!/bin/bash

if [ ! -d /var/www/wordpress ]; then
	mkdir -p /var/www/wordpress/
fi

if [ ! -f /var/www/wordpress/wp-config-sample.php ]; then
	echo "Copying wordpress core files in domain-dir"
	cp -r /var/wordpress/* /var/www/wordpress/
fi

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	echo "Waiting for MySQL server"
	sleep 7
	wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb:3306 --dbprefix=wp_
	wp config set --allow-root WP_MEMORY_LIMIT 256M
	wp config set --allow-root WP_REDIS_HOST redis
	wp config set --allow-root WP_REDIS_PORT 6379 --raw
	wp config set --allow-root WP_REDIS_DATABASE 0 --raw
	wp config set --allow-root WP_CACHE true --raw
	wp core install --allow-root --url=https://$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADM_NAME --admin_password=$WP_ADM_PASS --admin_email=$WP_ADM_MAIL --skip-email
	wp theme install --allow-root $WP_THEME
	wp theme activate --allow-root $WP_THEME
	wp user create --allow-root $WP_USR_NAME $WP_USR_MAIL --role=$WP_USR_ROLE --user_pass=$WP_USER_PASS
	wp plugin install --allow-root redis-cache --activate
	wp plugin update --allow-root --all
	wp redis enable --allow-root
	wget -qO /var/wordpress/content.txt $WP_POST_CONTENT
	cat /var/wordpress/content.txt | wp post generate --allow-root --post_content --count=10 --post_author=$WP_USR_NAME --post_date=2022-09-15
	cat /var/wordpress/content.txt | wp post generate --allow-root --post_content --count=5 --post_type=page --post_date=2022-09-15
	for ((i = 1; i < 19; i++))
	do
		 wp comment generate --allow-root --count=5 --post_id=$i
	done
	wget -qO /var/wordpress/img.png $WP_POST_LOGO
	ATTACHMENT_ID="$(wp media import --allow-root /var/wordpress/img.png --porcelain)"
	wp post list --allow-root --post_type=post --format=ids | xargs -d ' ' -I % wp post meta add --allow-root % _thumbnail_id $ATTACHMENT_ID
	wget -qO /var/wordpress/img2.jpg $WP_PAGE_LOGO
	ATTACHMENT_ID="$(wp media import --allow-root /var/wordpress/img2.jpg --porcelain)"
	wp post list --allow-root --post_type=page --format=ids | xargs -d ' ' -I % wp post meta add --allow-root % _thumbnail_id $ATTACHMENT_ID
fi

addgroup $FTP_USER > /dev/null
chown -R www-data:$FTP_USER /var/www/wordpress
chmod -R 664 /var/www/wordpress
find /var/www/wordpress -type d -exec chmod 775 {} \;
echo "Domain https://$DOMAIN_NAME is ready to browse"

exec $@