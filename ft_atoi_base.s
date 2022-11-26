global	_ft_atoi_base

section .text
	_ft_atoi_base:
		init:
			lea rcx, [rel l]
			xor rax, rax
		check_base:
			mov rdx, 0
			mov rsi, 1
			cmp byte [rdi + rax], 0
			je	next_step
			movzx rbx, byte[rdi + rax]
			cmp rbx, 64
			jle	check_them
			sub	rbx, 64
			mov rdx, 8
			check_them:
				push rcx
				mov	cl, bl
				shl rsi, cl
				pop rcx
				push rsi
				and	rsi, qword [rcx + rdx]
				pop rbx
				cmp rsi, rbx
				je	err_double
				or	qword [rcx + rdx], rbx
				inc	rax
				jmp check_base
			err_double:
				mov rax, -1
				ret
		next_step:
		xor	rax, rax
		ret
section	.data
	l times 2 dq 2
