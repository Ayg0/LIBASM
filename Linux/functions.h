#ifndef FUNCTIONS_H
# define FUNCTIONS_H
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

typedef int (*compareFunc)(t_list *, t_list *);

void 	printElement(t_list *ptr);
void 	printList(t_list *list);
void	breakList(t_list *list, size_t index, t_list **leftList, t_list **rightList);
void	mergeLists(t_list **list, t_list *leftList, t_list *rightList, compareFunc fun);
// Mandaroty:
extern size_t	ft_strlen(char *s);
extern char		*ft_strdup(const char *s);
extern long		ft_atoi_base(char *str, char *base);
extern int 		ft_read(int fd, char *buff, size_t size);
extern int		ft_strcmp(const char *s1, const char *s2);
extern int		ft_write(int fd, char *buff, size_t size);
extern char		*ft_strcpy(char *restrict dst, const char *restrict src);
// BONUS:
extern void		ft_freeList(t_list **list);
extern t_list	*ft_create_elem(void *data);
extern int		ft_list_size(t_list *begin_list);
extern t_list	*ft_list_last(t_list *begin_list);
extern t_list	*ft_list_push(t_list **begin_list, void *data);
extern void		ft_list_sort(t_list **begin_list, int (*cmp)());
extern void		ft_list_push_front(t_list **begin_list, void *data);
extern void		ft_breakList(t_list *list, size_t index, t_list **leftList, t_list **rightList);
extern void		ft_mergeLists(t_list **list, t_list *leftList, t_list *rightList, compareFunc fun);
extern void		ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
# endif

//elemt -> rax
//pointer -> rdi
//elemt r8
//rax last elem 
