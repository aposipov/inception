
FROM debian:buster



RUN apt update && apt install -y --no-install-recommends \
        mariadb-server-10.3 tini procps &&\
        rm -rf /var/lib/apt/lists/* &&\
        sed -i 's/bind-ad/# bind-ad/g' /etc/mysql/mariadb.conf.d/50-server.cnf &&\
        sed -i 's/#port/port /g' /etc/mysql/mariadb.conf.d/50-server.cnf
        # service mysql restart 

COPY tools/setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

ENTRYPOINT [ "./tmp/setup.sh" ]

# USER mysql

# CMD [ "mysqld_safe" ]

# try > exec $@; USER mysql; 
# CMD [/usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/x86_64-linux-gnu/mariadb19/plugin --user=mysql --skip-lo] 
# script env
# secure install
# restart after setup db user