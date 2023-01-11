
FROM debian:buster

RUN apt-get update\
		&& apt-get install -y --no-install-recommends redis procps \
		&& rm -rf /var/lib/apt/lists/*

COPY ./conf/redis.conf /etc/redis.conf

CMD [ "redis-server", "/etc/redis.conf" ]