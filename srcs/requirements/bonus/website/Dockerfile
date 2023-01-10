
FROM debian:buster

RUN apt update && apt install -y --no-install-recommends \
        procps nodejs &&\
        rm -rf /var/lib/apt/lists/*

COPY tools/ /

# RUN npm init -y && npm install express -y

CMD [ "node", "site.js" ]