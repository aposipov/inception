
FROM debian:buster

RUN apt update && apt install -y --no-install-recommends \
        vsftpd procps &&\
        rm -rf /var/lib/apt/lists/* &&\
        mkdir -p /var/www/wordpress/  

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh

ENTRYPOINT [ "./tmp/setup.sh" ]
# CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd.conf" ]