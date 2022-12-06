
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

clean:
			$(RM) $(OBJ)
			@echo -e "$(RED)*.o files is clean!$(NC)"

fclean:		clean
			$(RM) $(NAME)
			@echo -e "$(RED)All files is clean!$(NC)"

re:			fclean all

test:		$(NAME)
			valgrind ./$(NAME)