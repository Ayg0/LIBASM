global	_ft_write
extern	___error

section	.text
	_ft_write:
		mov rax, 0x2000004		; system call number check this: https://stackoverflow.com/questions/65528933/why-do-macos-use-absolute-memory-locations-for-system-calls
		syscall					; invokes the system call
		jc	err_hand			; jmp to error handeling if the carry bit is set
		ret						; return
	err_hand:
		push	rax				; pushes the value in rax to the stack to save it for later use, rax has the error value write returned
		call	___error		; calls the __error function
		pop		rcx				; get the value we've pushed to rcx
		mov	[rax], rcx			; sets the errno with the returned error from write
		mov 	rax, -1			; return -1
		ret						; return
