NAME = libasm.a

#linked_lists/ft_list_merge.s
SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_read.s \
		ft_write.s ft_strdup.s ft_atoi_base.s\
		linked_lists/ft_list_push_front.s\
		linked_lists/ft_create_elem.s \
		linked_lists/ft_list_size.s \
		linked_lists/ft_list_last.s \
		linked_lists/ft_list_remove_if.s\
		linked_lists/ft_list_sort.s\
		linked_lists/ft_mergeSort.s\
		linked_lists/ft_breakList.s\
		linked_lists/ft_mergeLists.s\
		linked_lists/ft_list_push.s
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
