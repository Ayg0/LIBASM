NAME = libasm.a

SRCS = ft_write.s ft_strlen.s ft_strcpy.s \
		ft_strcmp.s ft_read.s ft_strdup.s \
		ft_atoi_base.s

NS = nasm -f macho64 

OBJS = ${SRCS:.s=.o}

.s.o:
		$(NS) $<
		ar rcs $(NAME) $@


RM = rm -f

all: $(NAME)

$(NAME):	$(OBJS)

bin:	$(NAME)
	gcc -fsanitize=address main.c $(NAME)

clean:
		$(RM) $(OBJS)

fclean: clean
		$(RM) $(NAME) a.out

re: fclean bin

.PHONY: all clean fclean re bonus
