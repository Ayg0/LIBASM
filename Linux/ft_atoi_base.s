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
		mov rax, 1				; return 1 if it's a whitespace
		ret
	RET0:
		mov rax, 0
		ret
; ---------------------------------------
	getIndex:
		xor rax, rax				; init rax to Zero
	LOOP:
		cmp byte [rdi + rax], 0		; check if we reached '\0'
		je	RET_NO_FOUND			; then we didn't find our element
		cmp byte [rdi + rax], sil	; else we compare the current char to the element we're searching for.
		je	RET_INDEX				; return currentIndex
		inc rax
		jmp LOOP
	RET_NO_FOUND:
		mov rax, -1
		ret							; return -1 in case item not found
	RET_INDEX:
		ret
; ---------------------------------------
	BaseValidation:
		lea r9, [rel asciiFlags]			; load the relative address of asciiFlags
		mov rax, qword 0x280100003E00
		mov qword [r9], rax					; init's the positions of whitespaces, '+' and '-' to 1 
		mov qword [r9 + 8], 0				; init the rest of that memory to 0
		xor rax, rax	; baseLen = 0
	NEXT_CHECK:
		mov cl, byte [rdi + rax]
		cmp cl, 0							; check if we reached the end of the base
		je RET
		mov rsi, 0
		cmp cl, 64							; check if ascii of current character is less than 64
		jl	CHECK_DOUBLE					; if that's the case jump to check duplicated
		sub cl, 64							; if not we sub 64 so we check the next qword if flaged
		add rsi, 8							; add 8 to rsi to point to the next qword
	CHECK_DOUBLE:
		mov rdx, 1							; init rdx with 1
		shl	rdx, cl							; rdx << cl ; 1 << cl
		mov r10, rdx						; keep the value of rdx in r10
		and rdx, [r9 + rsi]					; we check if the bit at the qword is already flaged
		jnz	RET_NEGATIVE					; if it's flaged then the element accured before or it's a forbidden item (ex:'+')
		or	[r9 + rsi], r10					; if not we flag that element for next checks
		inc rax
		jmp NEXT_CHECK						; check the next char
	RET:
		ret									; return rax that contains the base len
	RET_NEGATIVE:
		mov rax, -1							; return -1 in case of an error.
		ret
; ---------------------------------------
	skipWhiteSpaces:
		xor rax, rax
	checkWhiteSpace:
		push rdi
		push rax
		mov rdi, [rdi, rax]					; rdi now contains the current char
		and rdi, 0xFF						; making sure that's only one byte that's set
		call ft_isSpace						; check if it's a whitespace
		pop r9
		pop rdi
		cmp rax, 0
		je	RET_SKIPPING_NBR				; return the number of character skipped if the current one isn't a whitespace
		mov rax, r9
		inc rax								; inc rax
		jmp checkWhiteSpace					; check next char
	RET_SKIPPING_NBR:
		mov rax, r9
		ret


; explain the flags
;	Memory
;	-------------------------------------------------
;	|      1st 8 bytes      |      2nd 8 bytes      |
;	-------------------------------------------------
;	represent all ascii using 16 bytes or 128 bit
;	if the bit at location X is 1 means that the character with X as ascii value is already present.
;	ex: A = 65 if bit 65 is 1 means the base have the character A in it.
