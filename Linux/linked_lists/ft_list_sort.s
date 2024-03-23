global ft_list_sort
extern mergeSortList
section .text
	ft_list_sort:
		push rdi
		push rsi
		call ft_list_size
		pop rdi
		pop rsi
		mov rdx, rax
		call mergeSortList
		ret
		