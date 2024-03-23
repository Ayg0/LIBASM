global ft_list_push
extern ft_create_elem
extern ft_list_last
extern printElement
extern malloc

section .text
	ft_list_push:
		push rdi
		mov rdi, rsi
		call ft_create_elem
		pop rdi
		cmp dword [rdi], 0
		je HANDLE_NULL
		push rax
		mov rdi, [rdi]
		call ft_list_last
		pop rcx
		mov [rax + 8], rcx
		ret
		HANDLE_NULL:
			mov [rdi], rax
		ret 
