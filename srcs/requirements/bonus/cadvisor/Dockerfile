
FROM debian:buster

RUN apt update && apt install -y --no-install-recommends \
        procps wget &&\
        rm -rf /var/lib/apt/lists/* &&\
        wget --no-check-certificate -O /usr/local/bin/cadvisor \
        https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor &&\
        # https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64 &&\
        chmod +x ./usr/local/bin/cadvisor

ENTRYPOINT [ "./usr/local/bin/cadvisor", "--port=8090" ]
