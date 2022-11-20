NAME = liasm.a

SRCS = ft_write.s ft_strlen.s

NS = ~/Desktop/NAS/nasm -f macho64 

OBJS = ${SRCS:.s=.o}

.s.o:
		$(NS) $<
		ar rcs $(NAME) $@


RM = rm -f

all: $(NAME)

$(NAME):	$(OBJS)

bin:	$(NAME)
	gcc	main.c $(NAME)

clean:
		$(RM) $(OBJS)

fclean: clean
		$(RM) $(NAME) a.out

re: fclean all

.PHONY: all clean fclean re bonus