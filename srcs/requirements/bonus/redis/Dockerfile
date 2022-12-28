
FROM debian:buster

RUN apt-get update\
		&& apt-get install -y --no-install-recommends redis \
		&& rm -rf /var/lib/apt/lists/*

# RUN sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g"  /etc/redis/redis.conf && \
#         sed -i "s|# maxmemory <bytes>|maxmemory 128mb|g"  /etc//redis/redis.conf && \
#         echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

COPY ./conf/redis.conf /etc/redis.conf

CMD [ "redis-server", "/etc/redis.conf" ]