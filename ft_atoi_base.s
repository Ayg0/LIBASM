global	_ft_atoi_base

section .text
	init:
		xor l, l
		ret
	_ft_atoi_base:
		call init
		mov rax, 4
		ret
section	.bss
	l resq 2