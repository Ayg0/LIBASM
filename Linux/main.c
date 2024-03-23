# include "functions.h"

int cmp_ints(int *nbr1, int *nbr2){
		if (nbr1 && nbr2)
			return !(*nbr1 == *nbr2);
		else
		 return 0;
}

void printElement(t_list *ptr){
	printf("%d ", *(int *)ptr->data);
	printf("%p\n", ptr->next);
}

void f(void *i){
	free(i);
}

void push(t_list **begin_list, void *data){
	t_list *node = ft_create_elem(data);
	if ((*begin_list))
		ft_list_last(*begin_list)->next = node;
	else
	 	*begin_list = node;
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
		*m = 5;
	ft_list_push_front(&ptr, i);
	ft_list_push_front(&ptr, j);
	ft_list_push_front(&ptr, k);
	ft_list_push_front(&ptr, l);
	ft_list_push_front(&ptr, m);
	//int nbr = 4;
	//if (ac == 2)
	//	nbr = atoi(av[1]);
	//for (size_t i = 0; i < nbr; i++){
	//	ft_list_push(&ptr, m);
	//	*m += 1;
	//}
	while (ptr)
	{
		printElement(ptr);
		tmp = ptr;
		ptr = ptr->next;
		free(tmp);
	}
}













