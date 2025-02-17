NAME = libftprintf.a

MY_SOURCES = ./ft_strlen.c \
		./ft_printf.c \
		./ft_printf_utils.c \
		./ft_printf_utils2.c \
		./ft_printf_utils3.c

MY_OBJECTS = $(MY_SOURCES:.c=.o)

CFLAGS = -Wall -Wextra -Werror

OBJECTS = $(MY_OBJECTS)

all: $(NAME)

$(NAME): $(OBJECTS)
	make -C ./Libft
	mv ./Libft/libft.a ./libftprintf.a
	ar -rcs $(NAME) $(OBJECTS)

.c.o:
	cc -c $(CFLAGS) $< -o $@ -I./

clean:
	rm -f $(MY_OBJECTS)
	make clean -C ./Libft

fclean: clean
	rm -f $(NAME)

re: fclean
	make all

.PHONY: all clean fclean re
