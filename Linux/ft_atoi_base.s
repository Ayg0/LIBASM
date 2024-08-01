global ft_atoi_base
global 	ft_isSpace
global 	getIndex
global 	BaseValidation
global skipWhiteSpaces

section .data
	asciiFlags times 2 dq 0
section .text
; ---------------------------------------

	ft_atoi_base:
	cmp rdi, 0
	je NULL_ERR
	cmp rsi, 0
	je NULL_ERR
	push rsi
	push rdi
	mov rdi, rsi
	call BaseValidation
	pop rdi
	pop rsi
	mov r9, rax		; r9 is the baseLen
	cmp r9, 2
	jl BASE_ERR
	push rdi
	push rsi
	push r9
	call skipWhiteSpaces
	pop r9
	pop rsi
	pop rdi
	xor rcx, rcx
	mov r10, rax
	MAIN_LOOP:
		cmp byte [rdi + r10], 0
		je RET_NBR
		push r9
		push r10
		push rdi
		push rsi
		push rcx
		mov rax, rsi
		mov rsi, [rdi + r10]
		mov rdi, rax
		and rsi, 0xFF
		call getIndex
		pop rcx
		pop rsi
		pop rdi
		pop r10
		pop r9
		cmp rax, -1
		je	RET_NBR
		mov r8, rax
		mov rax, rcx
		mul r9
		mov rcx, rax
		mov rax, r8
		add rcx, rax
		inc r10
		jmp MAIN_LOOP
	RET_NBR:
		mov rax, rcx
		ret
	NULL_ERR:
		mov rax, -1
		ret
	BASE_ERR:
		mov rax, -2
		ret
; ---------------------------------------
	ft_isSpace:
		cmp rdi, 32
		je	RET1
		cmp rdi, 9
		jl	RET0
		cmp rdi, 13
		jg	RET0
	RET1:
		mov rax, 1
		ret
	RET0:
		mov rax, 0
		ret
; ---------------------------------------
	getIndex:
		xor rax, rax
	LOOP:
		cmp byte [rdi + rax], 0
		je	RET_NO_FOUND
		cmp byte [rdi + rax], sil
		je	RET_INDEX
		inc rax
		jmp LOOP
	RET_NO_FOUND:
		mov rax, -1
		ret
	RET_INDEX:
		ret
; ---------------------------------------
	BaseValidation:
		lea r9, [rel asciiFlags]
		mov rax, qword 0x280100003E00
		mov qword [r9], rax
		mov qword [r9 + 8], 0
		xor rax, rax	; baseLen = 0
	NEXT_CHECK:
		mov cl, byte [rdi + rax]
		cmp cl, 0
		je RET
		mov rsi, 0
		cmp cl, 64
		jl	CHECK_DOUBLE
		sub cl, 64
		add rsi, 8
	CHECK_DOUBLE:
		mov rdx, 1
		shl	rdx, cl
		mov r10, rdx
		mov r11, [r9 + rsi]
		mov r11, [r9]
		and rdx, [r9 + rsi]
		jnz	RET_NEGATIVE
		or	[r9 + rsi], r10
		inc rax
		jmp NEXT_CHECK
	RET:
		ret
	RET_NEGATIVE:
		mov rax, -1
		ret
; ---------------------------------------
	skipWhiteSpaces:
		xor rax, rax
	checkWhiteSpace:
		push rdi
		push rax
		mov rdi, [rdi, rax]
		and rdi, 0xFF
		call ft_isSpace
		pop r9
		pop rdi
		cmp rax, 0
		je	RET_SKIPPING_NBR
		mov rax, r9
		inc rax
		jmp checkWhiteSpace
	RET_SKIPPING_NBR:
		mov rax, r9
		ret