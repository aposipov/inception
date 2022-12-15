# /bin/sh

## cd /tmp
mkdir -p /var/www/html/
wget --no-check-certificate -O  /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz
tar -xvzf /tmp/latest.tar.gz -C /var/www/html/
## mv wordpress/ /var/www/html/
chmod 755 -R /var/www/html/wordpress/
chown -R www-data:www-data /var/www/html/wordpress/

#######
cd /var/www/html/wordpress/ 
mv wp-config-sample.php wp-config.php