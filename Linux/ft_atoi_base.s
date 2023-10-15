global ft_atoi_base
section .data
	asciiFlags times 2 dq 0
section .text
	ft_atoi_base:
		push	rbp	; keeping track of the rbp
		cmp		rdi, 0	; checking for null str
		je		NullError
		cmp		rsi, 0	; checking for null base
		je		NullError
		lea		rdx, [rel asciiFlags]	; leading the address of the var to rdx
		mov		rax, qword 0x280100003E00	; loading a 64 bit immidiate to rax, bits for white spaces,'+' and '-' are set
		mov		qword [rdx], rax
		xor		rax, rax
		checkBase:
			mov r9, 1		; init r9 to be shifted
			mov	r8, rdx	; init r8 with the first qword of AsciiFlags
			mov byte cl, [rsi + rax]	; getting the char to cl
			cmp cl, 0									; end of the base
			je	lastCheck							; to check for size
			cmp cl, 64								; checking value of cl
			jl checkDuplicates
			sub cl, 64								; sub from cl to use the 2nd qword of asciiFlags
			add r8, 8									; loading the 2nd qword of asciiFlags
				checkDuplicates:
					shl r9, cl						; shifting r9 with cl
					push r9								; keeping track of r9
					and r9, qword[r8]						; anding it with the asciiFlags to check for duplicates
					jnz	errorDuplicates	; if equal so it's a duplicate
					pop r9								; getting the previeus value of r9
					or	qword[r8], r9					; if not set it as already found
					inc rax
					jmp checkBase				; continue
				lastCheck:
					cmp rax, 2		; check if size under 2
					jl	errorSize
					mov rcx, rax	; keep size in rcx
					xor rax, rax
					xor r8, r8
		convert:
			mov bl, byte [rdi + r8]
			cmp bl, 0	; check if str ended
			je	_return
			xor r9, r9
				getIndex:	; get index of the number from the base
					mov dl, byte [rsi + r9]
					cmp dl, 0
					je	_return
					cmp dl, bl
					je	addValue
					inc r9
					jmp getIndex
				addValue:		; multiply rax by the size of the base and add the index
					mul rcx
					add rax, r9
					inc r8
					jmp convert	; continue	
		_return:
			pop rbp
			ret
		errorSize:
			pop rbp
			mov rax, -3
			ret
		errorDuplicates:
			pop r9
			pop rbp
			mov rax, -2
			ret
	NullError:
		pop rbp
		mov rax, -1
		ret
; -1 	str or base are null
; -2 	Base elements error
; -3	Base Size error