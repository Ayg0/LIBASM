NAME = libasm.a

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s

NS = nasm -f elf64 

OBJS = ${SRCS:.s=.o}

.s.o:
		$(NS) $<
		ar rcs $(NAME) $@

RM = rm -f

all: $(NAME)

$(NAME):	$(OBJS)

bin:	$(NAME)
	gcc -g -fsanitize=address -zexecstack main.c $(NAME)

clean:
		$(RM) $(OBJS)

fclean: clean
		$(RM) $(NAME) a.out

re: fclean bin

.PHONY: all clean fclean re bonus
