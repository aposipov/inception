
.PHONY:		all build up down clean fclean re test

RED		= \033[1;31m
GREEN	= \033[1;32m
BLUE 	= \033[0;34m
NC		= \033[0;0m

all:		
			@echo -e "$(GREEN) \n make build $(NC) for build project!"
			@echo -e "$(GREEN) make up $(NC) for build and up project!"
			@echo -e "$(GREEN) make down $(NC) for down project!"
			@echo -e "$(RED) make prune $(NC) prune files!"
			
check:		
			@echo -e "$(BLUE) images all $(NC)"
			@docker image ls -a
			@echo -e "$(BLUE) containers all $(NC)"
			@docker container ls -a
			@echo -e "$(BLUE) volumes $(NC)"
			@docker volume ls
			@echo -e "$(BLUE) networks $(NC)"
			@docker network ls
			@echo -e "$(BLUE) docker ps $(NC)"
			@docker ps

build:		
			docker-compose -f ./srcs/docker-compose.yml build

up:			create-dir
			docker-compose -f ./srcs/docker-compose.yml up --build

down:		
			docker-compose -f ./srcs/docker-compose.yml down
			
create-dir:	
			@echo -e "$(GREEN) Create data directories $(NC)"
			@mkdir -p /home/${USER}/data/db
			@mkdir -p /home/${USER}/data/wp

clean-dir:	
			@echo -e "$(RED) Delete data directories $(NC)"
			@sudo rm -rf /home/${USER}/data/

pre_eval:
			@echo -e "$(RED) pre evaluation $(NC)"
			chmod +x ./srcs/tools/pre_eval.sh
			./srcs/tools/pre_eval.sh
prune:		
			@echo -e "$(RED) docker prune -f $(NC)"
			@docker system prune --all --force --volumes

####################################DEBUG#######################################

nginx:		
			# docker build --no-cache -t nginx-inc ./srcs/requirements/nginx/
			docker build -t nginx-inc ./srcs/requirements/nginx/
			@echo -e "$(GREEN) build NGinx $(NC)"
			# docker run --rm -it -p 8443:443 -p 8880:80 -p 8888:8888 nginx-inc bash
			# docker run --rm -it -p 1234:443 nginx-inc
			docker run --rm -p 443:443 -p 80:80 nginx-inc

mariadb:
			docker build -t mariadb-inc ./srcs/requirements/mariadb/
			@echo -e "$(GREEN) build MariaDB $(NC)"
			docker run --env-file ./srcs/.env --rm mariadb-inc

wordpress:
			# docker build --no-cache -t wordpress-inc ./srcs/requirements/wordpress/
			docker build -t wordpress-inc ./srcs/requirements/wordpress/
			@echo -e "$(GREEN) build WordPress $(NC)"
			# docker run --rm -it wordpress-inc bash
			docker run --rm wordpress-inc

adminer:	
			docker build -t adminer-inc ./srcs/requirements/bonus/adminer/
			@echo -e "$(GREEN) build Adminer $(NC)"
			# docker run -it -p 8080:8080 --rm adminer-inc bash
			docker run -p 8080:8080 --rm adminer-inc

redis:		
			docker build -t redis-inc ./srcs/requirements/bonus/redis/
			@echo -e "$(GREEN) build Redis $(NC)"
			docker run -it --rm redis-inc bash
			# docker run --rm redis-inc

ftp:		
			docker build -t ftp-inc ./srcs/requirements/bonus/ftp/
			@echo -e "$(GREEN) build FTP $(NC)"
			# docker run -it -p 21:21 --rm ftp-inc bash
			docker run -p 21:21 --rm ftp-inc

cadvisor:
			docker build -t cadvisor-inc ./srcs/requirements/bonus/cadvisor/
			@echo -e "$(GREEN) build cadvisor $(NC)"
			docker run --rm cadvisor-inc

website:
			docker build -t website-inc ./srcs/requirements/bonus/website/
			@echo -e "$(GREEN) build website $(NC)"
			docker run -p 8888:8888 --rm website-inc

django:
			docker build -t django-inc ./srcs/requirements/bonus/django/
			@echo -e "$(GREEN) build Django $(NC)"
			# docker run -it -p 8001:8001 --rm django-inc bash
			docker run -p 8001:8001 --rm django-inc

portainer:	
			docker volume create portainer_data
			docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always\
			-v /var/run/docker.sock:/var/run/docker.sock\
			-v portainer_data:/data portainer/portainer-ce:2.11.1

yacht:		
			docker volume create yacht
			docker run -d -p 8008:8008 -v /var/run/docker.sock:/var/run/docker.sock\
			 -v yacht:/config --name yacht selfhostedpro/yacht
			 #admin@yacht.local pass