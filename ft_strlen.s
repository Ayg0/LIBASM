global	_ft_strlen

section	.text
	_ft_strlen:
		xor	rax, rax		; initialize rax to zero
	start:
		cmp	byte [rdi + rax], 0	; compare the value pointed by rdi + rax to 0
		je	mov_on			; jmp to move on if they are equal
		inc	rax				; increment rax
		jmp start			; jmp to the start of the loop
	mov_on:
		ret					; return