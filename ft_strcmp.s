global	_ft_strcmp

section .text
	_ft_strcmp:
		mov dl, byte[rdi]
		mov cl, byte[rsi]
		cmp dl, 0
		je	check
		cmp cl, 0
		je	check
		cmp	dl, cl
		jne	check
		inc	rdi
		inc	rsi
		jmp	_ft_strcmp
	check:
		xor rax, rax
		sub dl, cl
		movsx rax, dl
		ret