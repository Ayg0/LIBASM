global	_ft_strcpy

section .text
	_ft_strcpy:
		xor	rax, rax					; initialize rax to zero
		start:
			mov	al, byte[rsi]			; moving the value pointed to by rsi to al
			mov byte[rdi], al			; movin the value in al to the place pointed to by rdi
			cmp al, 0					; check for the end of string
			je	mov_on					; end the loop
			inc	rdi						; increment rdi
			inc	rsi
			jmp	start					; keep the loop
		mov_on:
			mov rax, rdi				; mov the address in rdi to rax
			ret							; return