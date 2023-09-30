section .text
	global ft_strlen
ft_strlen:
	xor	rax, rax
	loop:
		cmp	byte [rdi + rax], 0
		je	end_loop
		inc	rax
		jmp	loop
	end_loop:
		ret
