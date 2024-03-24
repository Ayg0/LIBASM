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

void printList(t_list *list){
	printf("\nSTART -------------------------\n");
	while (list) {
		printElement(list);
		list = list->next;
	}
	printf("END -------------------------\n");
}

void mergeLists(t_list **list, t_list *leftList, t_list *rightList, compareFunc fun){
	t_list	*keepHead = *list;
	int leftListElem = 0;
	int rightListElem = 0;
	while (leftList && rightList) {
		leftListElem = *(int *)leftList->data;
		rightListElem = *(int *)rightList->data;
		if (fun(leftList, rightList)){
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
}

int	main(int ac, char **av){
	t_list *ptr = NULL;
	t_list *leftList = NULL;
	t_list *rightList = NULL;
	int *i = malloc(sizeof(int));
	 	*i = 0;
	int *j = malloc(sizeof(int));
	 	*j = 1;
	int *k = malloc(sizeof(int));
	 	*k = 2;
	int *l = malloc(sizeof(int));
	 	*l = 3;
	int *m = malloc(sizeof(int));
		*m = 4;
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
	ft_list_sort(&ptr, compareInt);
	//ft_mergeLists(&ptr,leftList, rightList, compareInt);
	//ft_breakList(ptr, 10, &leftList, &rightList);
	printList(ptr);
	//printList(leftList);
	//printList(rightList);
}













