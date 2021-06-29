# Just to mess up with prod, fix .Makefile on final

NAME = libftprint.a
LIBFT = libft

CC = gcc
CFLAGS = # -Wall -Wextra -Werror
AR = ar rcs
RM = rm -f

RAWSRC = ft_printf utils print_char
SRC =	$(addsuffix	.c,	$(RAWSRC))
OBJ =	$(SRC:%.c=%.o)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(NAME): $(OBJ)
	make all -C $(LIBFT)/
	cp $(LIBFT)/$(LIBFT).a $(NAME)
	$(AR) $@ $^
# $@ == curr. target. name
# $^ == curr. dependancy. list

all: $(NAME)

clean:
	make clean -C $(LIBFT)
	$(RM) $(OBJ)

fclean: clean
	make fclean -C $(LIBFT)
	$(RM) $(NAME)

re: fclean all

test: all
	$(CC) $(CFLAGS) -c -o main.o main.c
	$(CC) -o test.out -L. $(NAME) main.o
	./test.out

.PHONY: all clean fclean re test bonus