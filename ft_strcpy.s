global	_ft_strcpy

section .text
	_ft_strcpy:
		xor	rax, rax
		start:
			mov dl, byte[rsi + rax]
			mov byte[rdi + rax], dl
			cmp byte[rsi + rax], 0
			je	mov_on
			inc	rax
			jmp	start
		mov_on:
			mov rax, rdi
			ret