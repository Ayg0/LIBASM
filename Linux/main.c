# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <errno.h>
# include <unistd.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

extern size_t	ft_strlen(char *s);
extern char	*ft_strcpy(char *restrict dst, const char *restrict src);
extern int	ft_strcmp(const char *s1, const char *s2);
extern int 	ft_read(int fd, char *buff, size_t size);
extern int 	ft_write(int fd, char *buff, size_t size);
extern char	*ft_strdup(const char *s);
extern int	ft_atoi_base(char *str, char *base);
extern t_list *ft_create_elem(void *data);
extern void ft_list_push_front(t_list **begin_list, void *data);
extern int ft_list_size(t_list *begin_list);
extern t_list *ft_list_last(t_list *begin_list);
extern void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

int cmp_ints(int *nbr1, int *nbr2){
		if (nbr1 && nbr2){
			printf("~~~~~%d ", *nbr1);
			printf("%d\n", *nbr2);
			return !(*nbr1 == *nbr2);
		}
		else
		 return 0;
}

void f(void *i){
	free(i);
}
int	main(int ac, char **av){
	t_list *ptr = NULL;
	t_list *tmp = NULL;
	int *i = malloc(sizeof(int));
		*i = 0;
	int *j = malloc(sizeof(int));
		*j = 1;
	int *k = malloc(sizeof(int));
		*k = 2;
	int *l = malloc(sizeof(int));
		*l = 4;
	int *m = malloc(sizeof(int));
		*m = 4;
	ft_list_push_front(&ptr, i);
	ft_list_push_front(&ptr, j);
	ft_list_push_front(&ptr, k);
	ft_list_push_front(&ptr, l);
	ft_list_push_front(&ptr, m);
	int to_search_for = atoi(av[1]);
	printf("element = %d\n", *(int *)ptr->data);
	ft_list_remove_if(&ptr, &to_search_for, cmp_ints, free);
	printf("last element = %d\n", *(int *)ft_list_last(ptr)->data);
	while (ptr)
	{
		printf("%d ", *(int *)ptr->data);
		printf("%p\n", ptr->next);
		tmp = ptr;
		ptr = ptr->next;
		free(tmp);
	}	
}













