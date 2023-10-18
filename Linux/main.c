# include "funcions.h"

int cmp_ints(int *nbr1, int *nbr2){
		if (nbr1 && nbr2)
			return !(*nbr1 == *nbr2);
		else
		 return 0;
}

void f(void *i){
	free(i);
}
int	main(int ac, char **av){
	t_list *ptr = NULL;
	t_list *tmp = NULL;
	// int *i = malloc(sizeof(int));
	// 	*i = 0;
	// int *j = malloc(sizeof(int));
	// 	*j = 1;
	// int *k = malloc(sizeof(int));
	// 	*k = 2;
	// int *l = malloc(sizeof(int));
	// 	*l = 4;
	int *m = malloc(sizeof(int));
		*m = 4;
	// ft_list_push_front(&ptr, i);
	// ft_list_push_front(&ptr, j);
	// ft_list_push_front(&ptr, k);
	// ft_list_push_front(&ptr, l);
	int nbr = atoi(av[1]);
	for (size_t i = 0; i < nbr; i++)
		ft_list_push_front(&ptr, m);
	
	// printf("element = %d\n", *(int *)ptr->data);
	// ft_list_remove_if(&ptr, &nbr, cmp_ints, free);
	printf("last element = %d\n", *(int *)ft_list_last(ptr)->data);
	// while (ptr)
	// {
	// 	printf("%d ", *(int *)ptr->data);
	// 	printf("%p\n", ptr->next);
	// 	tmp = ptr;
	// 	ptr = ptr->next;
	// 	free(tmp);
	// }	
}













