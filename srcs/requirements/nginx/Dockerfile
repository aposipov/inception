
FROM debian:buster

RUN apt update && apt install -y\
        nocache --no-install-recommends\
        nginx openssl procps htop\
        && openssl req -x509 -nodes -days 42 -newkey rsa:2048\
	-keyout /etc/ssl/private/nginx-selfsigned.key\
	-out /etc/ssl/certs/nginx-selfsigned.crt\
	-subj "/C=RU/ST=Moscow/L=Moscow/O=42school/OU=/CN=lchristi.42.fr/emailAddress=lchristi@42.fr"\
        && rm -rf /var/lib/apt/lists/* 

COPY conf/lchristi42fr /etc/nginx/sites-available/
COPY tools/index.html /var/www/wordpress/

RUN ln -s /etc/nginx/sites-available/lchristi42fr /etc/nginx/sites-enabled/lchristi42fr

# ENTRYPOINT ["nginx", "-g", "daemon off;"]

CMD [ "nginx", "-g", "daemon off;" ]

# conf +
# ssl certif +
# RUN apt install -y procps htop