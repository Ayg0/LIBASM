extern __errno_location
global ft_read
section .text
	ft_read:
		mov eax, 0
		syscall
		jc _errno
		ret
	_errno:
		push rbp
		push rax
		call __errno_location WRT ..plt
		pop rcx
		mov byte [rax], cl
		pop rbp
		mov rax, -1
		ret
