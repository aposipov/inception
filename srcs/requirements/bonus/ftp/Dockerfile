
FROM debian:buster

COPY ./tools/setup.sh /tmp/

RUN apt update && apt install -y --no-install-recommends \
        vsftpd procps &&\
        rm -rf /var/lib/apt/lists/* &&\
        mkdir -p /var/www/wordpress/ &&\
        chmod +x /tmp/setup.sh

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

ENTRYPOINT [ "./tmp/setup.sh" ]