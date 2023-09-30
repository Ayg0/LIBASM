global	_ft_strcmp

section .text
	_ft_strcmp:
		mov dl, byte[rdi]	; mov the value poited to by rdi to dl
		mov cl, byte[rsi]	; mov the value poited to by rsi to cl
		cmp dl, 0			; compare to zero
		jz	check			; jmp to check
		cmp cl, 0			
		je	check
		cmp	dl, cl			; compare the two values
		jne	check			; jmp to check if they aren't the same
		inc	rdi				; increment rdi
		inc	rsi
		jmp	_ft_strcmp		; keep the loop
	check:
		xor rax, rax		; initialize to zero
		sub dl, cl			; subtruct cl from dl and put it to dl
		movsx rax, dl		; mov the value with extanding the sign to rax
		ret					; return