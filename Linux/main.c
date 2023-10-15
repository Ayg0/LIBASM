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
int	main(int ac, char **av){
	// int j = ft_atoi_base(av[1], av[2]);
	// printf("%d\n", i);
	t_list *ptr = NULL;
	t_list *tmp = NULL;
	int numbers[] = {0,1,2,3,4};
	int i = 0;
	while (i < 5){
		ft_list_push_front(&ptr, &numbers[i]);
		i++;
	}
	while (ptr)
	{
		printf("%d\n", *(int *)ptr->data);
		tmp = ptr;
		ptr = ptr->next;
		free(tmp);
	}
	
	
}
