global	_ft_strlen

section	.text
	_ft_strlen:
		xor	rax, rax
	start:
		cmp	byte [rdi], 0
		je	mov_on
		inc	rax
		inc	rdi
		jmp start
	mov_on:
		ret