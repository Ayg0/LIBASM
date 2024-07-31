#make NAME=ft_atoi_baseTests

NAME = ft_atoi_baseTests

LIBASM = ../libasm.a

SRC = $(NAME).c

LIB = $(LIBASM) jtest.a

all: $(NAME)

$(NAME): $(SRC) $(LIBASM)
	gcc -g -z noexecstack -o $(NAME) $(SRC) $(LIB)

$(LIBASM):
	make -C ..

clean:
	make -C .. fclean
	rm -f $(NAME)

re: clean all

.PHONY: clean re