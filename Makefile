NAME = liasm.a

SRCS = ft_write.s ft_strlen.s ft_strcpy.s

NS = ~/Desktop/NAS/nasm -f macho64 -g

OBJS = ${SRCS:.s=.o}

.s.o:
		$(NS) $<
		ar rcs $(NAME) $@


RM = rm -f

all: $(NAME)

$(NAME):	$(OBJS)

bin:	$(NAME)
	gcc	-fsanitize=address -g main.c $(NAME)

clean:
		$(RM) $(OBJS)

fclean: clean
		$(RM) $(NAME) a.out

re: fclean all

.PHONY: all clean fclean re bonus