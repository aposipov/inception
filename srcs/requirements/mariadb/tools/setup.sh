#!/bin/bash
echo "***START SETUP DB***"
if ! [ -d "/var/lib/mysql/wp_db" ]; then
    service mysql start
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8;"
    mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysqladmin -u root password $DB_RPASS
    service mysql stop
fi

# exec $@
echo "***START DB***"
exec /usr/bin/mysqld_safe