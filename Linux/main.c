# include "functions.h"
#include <stddef.h>
#include <stdio.h>

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

int compareInt(t_list *firstNode, t_list *secondNode){
	int firstNodeData = *(int *)firstNode->data;
	int secondNodeData = *(int *)secondNode->data;

	return (firstNodeData - secondNodeData);
}

void	breakList(t_list *list, size_t index, t_list **leftList, t_list **rightList){
	for (size_t i = 0; i < index; i++){
		ft_list_push(leftList, list->data);
		list = list->next;
	}
	while (list) {
		ft_list_push(rightList, list->data);
		list = list->next;
	}
}

void printList(t_list *list){
	if (!list)
		return;
	printf("\nSTART -------------------------\n");
	while (list) {
		printElement(list);
		list = list->next;
	}
	printf("END -------------------------\n");
}

void	mergeSort(t_list **list, size_t size, compareFunc fun){
	t_list	*leftList = NULL;
	t_list	*rightList = NULL;
	t_list	*keepHead = *list;

	if (size > 2){
		breakList(*list, size / 2, &leftList, &rightList);
		mergeSort(&leftList, size / 2, fun);
		mergeSort(&rightList, size - (size / 2), fun);
	}
	while (leftList && rightList) {
		if (fun(leftList, rightList) >= 0){
			(*list)->data = rightList->data;
			rightList = rightList->next;
		}
		else{
			(*list)->data = leftList->data;
			leftList = leftList->next;
		}
		*list = (*list)->next;
	}
	while (leftList) {
		(*list)->data = leftList->data;
		leftList = leftList->next;
		*list = (*list)->next;
	}
	while (rightList) {
		(*list)->data = rightList->data;
		rightList = rightList->next;
		*list = (*list)->next;
	}
	*list = keepHead;
	return ;
}

int	main(int ac, char **av){
	t_list *ptr = NULL;
	t_list *tmp = NULL;
	int *i = malloc(sizeof(int));
	 	*i = 0;
	int *j = malloc(sizeof(int));
	 	*j = 1;
	int *k = malloc(sizeof(int));
	 	*k = -6;
	int *l = malloc(sizeof(int));
	 	*l = 85;
	int *m = malloc(sizeof(int));
		*m = 8;
	ft_list_push(&ptr, i);
	ft_list_push(&ptr, j);
	ft_list_push(&ptr, k);
	ft_list_push(&ptr, l);
	ft_list_push(&ptr, m);
	//int nbr = 4;
	//if (ac == 2)
	//	nbr = atoi(av[1]);
	//for (size_t i = 0; i < nbr; i++){
	//	ft_list_push(&ptr, m);
	//	*m += 1;
	//}
	mergeSort(&ptr, ft_list_size(ptr), compareInt);
	printList(ptr);
}













