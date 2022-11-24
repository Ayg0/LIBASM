global	_ft_strcpy

section .text
	_ft_strcpy:
		xor	rax, rax					; initialize rax to zero
		start:
			mov byte[rdi], byte[rsi]	; mov the value pointed by rsi to the one pointed by rdi
			cmp byte[rsi], 0			; check for the end of string
			je	mov_on					; end the loop
			inc	rdi						; increment rdi
			inc	rsi
			jmp	start					; keep the loop
		mov_on:
			mov rax, rdi				; mov the address in rdi to rax
			ret							; return