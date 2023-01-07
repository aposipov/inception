
FROM debian:buster

RUN apt-get update && \
        apt-get install -y --no-install-recommends \
        python3.7 python3-pip && \
        rm -rf /var/lib/apt/lists/*
        
RUN pip3 install django && \
        mkdir /home/prj && cd /home/prj/ && \
        django-admin startproject first && \
        python3 ./first/manage.py migrate

ENTRYPOINT [ "python3", "./home/prj/first/manage.py", "runserver", "0.0.0.0:8001", "--noreload"]

# django-admin startproject first
# python3 ./manage.py runserver 0.0.0.0<port>
# python3-dev

# python3 ./manage.py startapp mypage