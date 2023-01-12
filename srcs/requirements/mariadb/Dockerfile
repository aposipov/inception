
FROM debian:buster

RUN apt update && apt install -y --no-install-recommends \
        mariadb-server-10.3 procps &&\
        rm -rf /var/lib/apt/lists/* &&\
        sed -i 's/bind-ad/# bind-ad/g' /etc/mysql/mariadb.conf.d/50-server.cnf &&\
        sed -i 's/#port/port /g' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

ENTRYPOINT [ "./tmp/setup.sh" ]