NAME = liasm.a

SRCS = ft_write.s ft_strlen.s ft_strcpy.s ft_strcmp.s

NS = ~/Desktop/NAS/nasm -f macho64 -g

OBJS = ${SRCS:.s=.o}

.s.o:
		$(NS) $<
		ar rcs $(NAME) $@


RM = rm -f

all: $(NAME)

$(NAME):	$(OBJS)

bin:	$(NAME)
	gcc -g main.c $(NAME)

clean:
		$(RM) $(OBJS)

fclean: clean
		$(RM) $(NAME) a.out

re: fclean bin

.PHONY: all clean fclean re bonus