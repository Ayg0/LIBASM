# include "functions.h"
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

//int cmp_ints(int *nbr1, int *nbr2){
//		if (nbr1 && nbr2)
//			return !(*nbr1 == *nbr2);
//		else
//		 return 0;
//}

void printElement(t_list *ptr){
	printf("%d ", *(int *)ptr->data);
	printf("%p\n", ptr->next);
}

void f(void *i){
	free(i);
}

int compareInt(t_list *firstNode, t_list *secondNode){
	int firstNodeData = *(int *)firstNode->data;
	int secondNodeData = *(int *)secondNode->data;

	return (firstNodeData >= secondNodeData);
}

//void ft_freeList(t_list **list){
//	t_list *tmp;
//	t_list *iter = *list;
//	while (iter) {
//		//free(iter->data);
//		tmp = iter;
//		iter = iter->next;
//		free(tmp);
//	}
//	*list = NULL;
//}

void printList(t_list *list){
	printf("\nSTART -------------------------\n");
	while (list) {
		printf("%p -> ", &list);
		printElement(list);
		list = list->next;
	}
	printf("END -------------------------\n");
}

int	main(int ac, char **av){
	t_list *ptr = NULL;
	t_list *leftList = NULL;
	t_list *rightList = NULL;
	//int *i = malloc(sizeof(int));
	// 	*i = 0;
	//int *j = malloc(sizeof(int));
	// 	*j = 1;
	//int *k = malloc(sizeof(int));
	// 	*k = 2;
	//int *l = malloc(sizeof(int));
	// 	*l = 3;
	//int *m = malloc(sizeof(int));
	//	*m = 4;
	//ft_list_push(&ptr, i);
	//ft_list_push(&ptr, j);
	//ft_list_push(&ptr, k);
	//ft_list_push(&ptr, l);
	//ft_list_push(&ptr, m);
	int nbr = 0;
	if (ac >= 2)
		nbr = ac - 1;
	for (size_t i = 0; i < nbr; i++){
		int *tmp = malloc(sizeof(int));
		*tmp = atoi(av[i + 1]);
		ft_list_push(&ptr, tmp);
	}
	//for (size_t i = 0; i < 2; i++){
	//	int *tmp = malloc(sizeof(int));
	//	*tmp = atoi(av[i + 1]);
	//	ft_list_push(&leftList, tmp);
	//}
	//for (size_t i = 2; i < nbr; i++){
	//	int *tmp = malloc(sizeof(int));
	//	*tmp = atoi(av[i + 1]);
	//	ft_list_push(&rightList, tmp);
	//}
	//ft_mergeLists(&ptr,leftList, rightList, compareInt);
	//ft_breakList(ptr, 10, &leftList, &rightList);
	printList(ptr);
	ft_list_sort(&ptr, compareInt);
	printList(ptr);
	//ft_freeList(&ptr);
	//printList(leftList);
	//printList(rightList);
}













