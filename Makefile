# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: ikole <ikole@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/06 11:18:51 by ikole          #+#    #+#                 #
#    Updated: 2020/03/10 02:27:42 by ikole         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

OBJ = $(SRC:.s=.o)

BONUS_SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s \
			ft_strdup.s ft_atoi_base_bonus.s ft_list_size_bonus.s \
			ft_list_push_front_bonus.s ft_list_sort_bonus.s \
			ft_list_remove_if_bonus.s

BONUS_OBJ = $(BONUS_SRC:.s=.o)

ifdef WITH_BONUS
	OBJ_FILES = $(BONUS_OBJ)
else
	OBJ_FILES = $(OBJ)
endif

.PHONY: clean fclean

all: $(NAME)


$(NAME): $(OBJ_FILES)
	ar rc $(NAME) $(OBJ_FILES)

%.o: %.s
	nasm -fmacho64 $? -o $@

bonus: $(OBJ_FILES)
	@make WITH_BONUS=1 all

test: bonus
	gcc -L. -lasm main.c -o libasm
	./libasm

re: fclean all

clean:
	/bin/rm -f $(OBJ)
	/bin/rm -f $(BONUS_OBJ)

fclean: clean
	/bin/rm -f $(NAME)
	/bin/rm -f libasm
