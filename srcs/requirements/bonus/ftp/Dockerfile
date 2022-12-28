
FROM debian:buster

# ARG FTP_USR \
    # FTP_PWD

RUN apt update && apt install -y --no-install-recommends \
        vsftpd \
        && rm -rf /var/lib/apt/lists/* 

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

# RUN adduser -h /var/www -s /bin/false -D ${FTP_USR} && \
#     echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd && \
#     adduser ${FTP_USR} root

# RUN sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd.conf && \
#     sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd.conf && \
#     sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd.conf && \
#     sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd.conf

# RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf &&\
#     echo 'seccomp_sandbox=NO' >> /etc/vsftpd.conf && \
#     echo 'pasv_enable=YES' >> /etc/vsftpd.conf

# WORKDIR /var/www

# EXPOSE 21

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]