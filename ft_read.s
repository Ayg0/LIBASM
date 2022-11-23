global	_ft_read
extern	___error

section	.text
	_ft_read:
		mov rax, 0x2000003
		syscall
		jc	err_hand
		ret
	err_hand:
		push	rax
		call	___error
		pop		rcx
		mov		[rax], rcx
		mov 	rax, -1
		ret