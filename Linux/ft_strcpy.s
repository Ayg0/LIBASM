section .text
	global ft_strcpy
ft_strcpy:
	xor rax, rax
	loop:
		mov cl, byte [rsi + rax]
		mov byte [rdi + rax], cl
		cmp cl, 0
		je	end_loop
		inc rax
		jmp loop
	end_loop:
		mov rax, rdi
		ret
