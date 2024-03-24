global ft_list_sort
extern mergeSortList
extern ft_list_size
section .text
	ft_list_sort:
		push rdi
		push rsi
		mov rdi, [rdi]
		call ft_list_size
		pop rsi
		pop rdi
		mov rdx, rax
		call mergeSortList
		ret
		