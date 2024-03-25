#include "functions.h"
#include <stdlib.h>

void freeList(t_list **list){
	t_list *tmp;
	while (*list) {
		free((*list)->data);
		tmp = *list;
		*list = (*list)->next;
		free(tmp);
	}
	*list = NULL;
}

void mergeLists(t_list **list, t_list *leftList, t_list *rightList, compareFunc fun){
	t_list	*keepHead = *list;

	while (leftList && rightList) {
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

void	mergeSort(t_list **list, size_t size, compareFunc fun){
	t_list	*leftList = NULL;
	t_list	*rightList = NULL;

	if (size > 2){
		breakList(*list, size / 2, &leftList, &rightList);
		mergeSort(&leftList, size / 2, fun);
		mergeSort(&rightList, size - (size / 2), fun);
	}
	if (size >= 2)
		mergeLists(list, leftList, rightList, fun);
	return ;
}

void	breakList(t_list *list, size_t index, t_list **leftList, t_list **rightList){
	for (size_t i = 0; i < index && list; i++){
		ft_list_push(leftList, list->data);
		list = list->next;
	}
	while (list) {
		ft_list_push(rightList, list->data);
		list = list->next;
	}
}