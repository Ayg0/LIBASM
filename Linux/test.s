section .data
	phrase db "hello guys"

section .text
	global test
test:
	mov rax, 1
	mov rdi, 1
	lea rsi, [rel phrase]
	mov rdx, 10
	syscall
	mov rax, 60
	mov rdi, 66
	syscall
	ret
