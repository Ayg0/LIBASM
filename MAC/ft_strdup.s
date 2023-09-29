global	_ft_strdup
extern	_ft_strlen
extern	_ft_strcpy
extern	_malloc
extern	___error

section .text
	_ft_strdup:
		push	rdi			; pushing the address of the s1 to the stack
		call	_ft_strlen	; calling strlen
		inc		rax			; incement the len by one
		mov		rdi, rax	; loading the size of allocation into rdi for malloc
		call	_malloc		; calling malloc
		jc		err_hand	; jmp to err_hand, if malloc failed and sets the carry bit
		pop		rsi			; loading the address of s1 to rsi
		mov		rdi, rax	; loading the address allocated by malloc to rdi
		call	_ft_strcpy	; calling strcpy
		ret					; return
	err_hand:
		push	rax			; saving the value of rax for later use
		call	___error	; calling __error
		pop		rdi			; loading rdi with the value in the stack (from rax before the call)
		mov		[rax], rdi	; asign the value of rdi to errno
		mov		rax, 0		; returning NULL
		ret