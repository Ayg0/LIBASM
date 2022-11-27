global	_ft_atoi_base

section .text
	_ft_atoi_base:
		init_this_thing:
			push rbx
			push rdi
			lea rcx, [rel l]
			mov rax, 0x280100003E00
			mov qword[rcx], rax
			xor rax, rax
		check_base:
			mov rdx, 0
			mov rdi, 1
			cmp byte [rsi + rax], 0
			je	next_step
			mov bl, byte[rsi + rax]
			cmp bl, 64
			jbe	check_them
			sub	bl, 64
			mov rdx, 8
			check_them:
				push rcx
				mov	cl, bl
				shl rdi, cl
				pop rcx
				push rdi
				and	rdi, qword [rcx + rdx]
				pop rbx
				cmp rdi, rbx
				je	err
				or	qword [rcx + rdx], rbx
				inc	rax
				jmp check_base
		next_step:
		cmp rax, 2
		jl err
		pop rdi
		xor rax, rax
		
		pop rbx
		ret
		err:
			mov rax, -1
			pop rdi
			pop rbx
			ret
section	.data
	l times 2 dq 0
