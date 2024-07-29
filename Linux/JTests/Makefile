#make NAME=ft_atoi_baseTests

NAME = test

SRC = $(NAME).c

LIB = libasm.a jtest.a

all: $(NAME)

$(NAME): $(SRC)
	gcc -z noexecstack -o $(NAME) $(SRC) $(LIB)

clean:
	rm -f $(NAME)

re: clean all

.PHONY: clean re