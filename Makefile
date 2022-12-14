
.PHONY:		all build up down clean fclean re test

RED		= \033[1;31m
GREEN	= \033[1;32m
BLUE 	= \033[0;34m
NC		= \033[0;0m

all:		
			@echo -e "$(GREEN) \n make buid $(NC) for build project!"
			@echo -e "$(GREEN) make up $(NC) for build and up project!"
			@echo -e "$(GREEN) make down $(NC) for down project!"
			@echo -e "$(RED) make clean $(NC) for clean project!"
			@echo -e "$(GREEN) make fclean $(NC) fclean!"
			@echo -e "$(GREEN) make re $(NC) re!"
			
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

up:			create-dir
			docker compose -f ./srcs/docker-compose.yml up 

create-dir:	
			@echo -e "$(GREEN) Create data directories $(NC)"
			@mkdir -p /home/${USER}/data/db
			@mkdir -p /home/${USER}/data/wp

clean-dir:	
			@echo -e "$(RED) Delete data directories $(NC)"
			@rm -rf /home/${USER}/data/



clean:
			$(RM) $(OBJ)
			@echo -e "$(RED)*.o files is clean!$(NC)"

fclean:		clean
			$(RM) $(NAME)
			@echo -e "$(RED)All files is clean!$(NC)"

re:			fclean all

prune:		
			@echo -e "$(RED) docker prune -f $(NC)"
			@docker system prune -f

portainer_install:	
			docker volume create portainer_data
			docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always\
			-v /var/run/docker.sock:/var/run/docker.sock\
			-v portainer_data:/data portainer/portainer-ce:2.11.1

portainer:	
			docker start portainer

################################################################################

nginx:		
			# docker build --no-cache -t nginx-inc ./srcs/requirements/nginx/
			docker build -t nginx-inc ./srcs/requirements/nginx/
			@echo -e "$(GREEN) build NGinx $(NC)"
			docker run --rm -it -p 1234:443 -p 1235:80 nginx-inc bash
			# docker run --rm -it -p 1234:443 nginx-inc

mariadb:
			docker build --no-cache -t mariadb-inc ./srcs/requirements/mariadb/
			@echo -e "$(GREEN) build MariaDB $(NC)"
			docker run --rm -it mariadb-inc /bin/bash

wordpress:
			docker build --no-cache -t wordpress-inc ./srcs/requirements/wordpress/
			@echo -e "$(GREEN) build WordPress $(NC)"
			docker run --rm -it wordpress-inc /bin/bash