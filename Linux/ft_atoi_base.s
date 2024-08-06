global ft_atoi_base
global 	ft_isSpace
global 	getIndex
global 	BaseValidation
global skipWhiteSpaces

section .data
	asciiFlags times 2 dq 0
section .text

; rdi = str, rsi = base
; ---------------------------------------
	ft_atoi_base:
	cmp rdi, 0			; check if str is NULL
	je NULL_ERR
	cmp rsi, 0			; check if base is NULL
	je NULL_ERR
	push rsi
	push rdi
	mov rdi, rsi		; move base to be the first argument
	call BaseValidation
	pop rdi
	pop rsi
	mov r9, rax		; rax is baseValidation Return which is the size of the Base (and -1 if an Error Accured)
	cmp r9, 2		; compare the return to 2
	jl BASE_ERR		; if baseLen < 2 Or error Accured (-1) jmp to BASE_ERR
	push rdi
	push rsi
	push r9
	call skipWhiteSpaces		; call SkipWhiteSpaces with the string
	pop r9
	pop rsi
	pop rdi
	xor rcx, rcx				; initialize rcx to 0
	mov r10, rax				; r10 is used as the current index in str, initialize it with the index after the last whiteSpace;
	MAIN_LOOP:
		cmp byte [rdi + r10], 0	; if end of the string break the loop.
		je RET_NBR
		push r9
		push r10
		push rdi
		push rsi
		push rcx
		mov rax, rsi			; keep rsi in rax.
		mov rsi, [rdi + r10]	; rsi now is the current character.
		mov rdi, rax			; rdi keeps the base.
		and rsi, 0xFF			; making sure rsi only have our character.
		call getIndex			; get the index of the current character in the base string.
		pop rcx
		pop rsi
		pop rdi
		pop r10
		pop r9
		cmp rax, -1				; if it doesn't exists break the loop.
		je	RET_NBR
		mov r8, rax				; r8 have the index of the character.
		mov rax, rcx			; rcx holds the currentNumber.
		mul r9					; multiply currentNumber with baseLen.
		mov rcx, rax			; mov output of the multiplication to the currentNumber.
		add rcx, r8				; add the index to the currentNumber.
		inc r10					; increment the Index of the string.
		jmp MAIN_LOOP			; jump back to the MAIN_LOOP.
	RET_NBR:
		mov rax, rcx			; mov the number computed to rax so we can return it.
		ret
	NULL_ERR:
		mov rax, -1				; return -1 in case one of or both of the arguments are NULL.
		ret
	BASE_ERR:
		mov rax, -2				; return -2 in case of an invalid base.
		ret
; ---------------------------------------
	ft_isSpace:
		cmp rdi, 32				; cmp if the character is a space
		je	RET1
		cmp rdi, 9				; check if the character is not in range of 9 -> 13 (range of the rest of white spaces).
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