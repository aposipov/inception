
FROM debian:buster

RUN apt update && apt install -y \
        --no-install-recommends \
        nginx openssl procps\
        && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=RU/ST=RF/L=vladivostok/O=42school/OU=lchristi/CN=localhost/emailAddress=lchristi@42.fr" \
        && rm -rf /var/lib/apt/lists/* 

COPY conf/lchristi.42.fr /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/lchristi.42.fr /etc/nginx/sites-enabled/lchristi.42.fr

ENTRYPOINT ["nginx", "-g", "daemon off;"]

# conf +
# ssl certif +
# install -y procps htop