extern malloc
extern __errno_location
extern ft_strlen
extern ft_strcpy
global ft_strdup

section .text
	ft_strdup:
		push rbp
		push rdi
		call ft_strlen
		mov rdi, rax
		call malloc wrt ..plt
		jc err_hand
		mov rdi, rax
		pop rsi
		call ft_strcpy
		pop rbp
		ret
	err_hand:
		push rax
		call __errno_location wrt ..plt
		pop rdi
		mov [rax], rdi
		mov rax, 0
		pop rbp
		ret

