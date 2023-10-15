NAME = libasm.a

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_read.s \
		ft_write.s ft_strdup.s ft_atoi_base.s\
		ft_list_push_front.s ft_create_elem.s\
		ft_list_size.s ft_list_last.s
NS = nasm -g -f elf64 

OBJS = ${SRCS:.s=.o}

.s.o:
		$(NS) $<
		ar rcs $(NAME) $@

RM = rm -f

all: $(NAME)

$(NAME):	$(OBJS)

bin:	main.c $(NAME)
	gcc -g -zexecstack main.c $(NAME) -o bin

clean:
		$(RM) $(OBJS)

fclean: clean
		$(RM) $(NAME) bin

re: fclean bin

.PHONY: all clean fclean re bonus
