global	_ft_strdup
extern	_ft_strlen
extern	_ft_strcpy
extern	_malloc
extern	___error

section .text
	_ft_strdup:
		push	rdi
		call	_ft_strlen
		inc		rax
		mov		rdi, rax
		call	_malloc
		jc		err_hand
		pop		rsi
		mov		rdi, rax
		call	_ft_strcpy
		ret
	err_hand:
		push	rax
		call	___error
		pop		rdi
		mov		[rax], rdi
		mov		rax, 0
		ret