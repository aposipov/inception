
FROM debian:buster

RUN apt update && apt install -y --no-install-recommends \
    mariadb-server-10.3 \
    && rm -rf /var/lib/apt/lists/* \
    && service mysql restart 

RUN sed -i 's/bind-ad/# bind-ad/g' /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "mysqld_safe" ]


# secure install
# restart after setup db user