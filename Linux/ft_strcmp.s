section .text
	global ft_strcmp
ft_strcmp:
	xor	rax, rax
	loop:
		mov	cl, [rdi + rax]
		mov	ch, [rsi + rax]
		cmp	cl, 0
		jz	end_loop
		cmp	ch, 0
		jz	end_loop
		cmp	cl, ch
		jne	end_loop
		inc rax
		jmp loop
	end_loop:
		xor rax, rax
		sub cl, ch
		movsx eax, cl
		ret
		
