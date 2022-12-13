
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
			@echo -e "$(BLUE) images $(NC)"
			@docker image ls
			@echo -e "$(BLUE) containers $(NC)"
			@docker container ls
			@echo -e "$(BLUE) volumes $(NC)"
			@docker volume ls
			@echo -e "$(BLUE) networks $(NC)"
			@docker network ls
			@echo -e "$(BLUE) docker ps $(NC)"
			@docker ps

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

test:		$(NAME)
			valgrind ./$(NAME)

nginx:		
			docker build -t nginx-inc ./srcs/requirements/nginx/
			docker run -it nginx-inc /bin/sh
			# --no-cache