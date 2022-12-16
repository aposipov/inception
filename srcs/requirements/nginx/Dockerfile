
FROM debian:buster

RUN apt update && apt install -y \
        nocache --no-install-recommends \
        nginx openssl procps htop \
        && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=RU/ST=RF/L=vladivostok/O=42school/OU=lchristi/CN=lchristi.42.fr/emailAddress=lchristi@42.fr"\
        && rm -rf /var/lib/apt/lists/* 

# COPY conf/lchristi.42.fr /etc/nginx/sites-available/
COPY conf/default2 /etc/nginx/sites-available/
COPY tools/index_t.html /var/www/html/ 

# RUN ln -s /etc/nginx/sites-available/lchristi.42.fr /etc/nginx/sites-enabled/lchristi.42.fr
RUN ln -s /etc/nginx/sites-available/default2 /etc/nginx/sites-enabled/default2

# ENTRYPOINT ["nginx", "-g", "daemon off;"]

CMD [ "nginx", "-g", "daemon off;" ]

# conf +
# ssl certif +
# RUN apt install -y procps htop