global	_ft_atoi_base

section .text
	_ft_atoi_base:
		init_this_thing:
			push rbx				; saving rbx
			push rdi				; saving rdi (address of first arg)
			lea rcx, [rel l]		; loading the relative address of l to rcx
			mov rax, 0x280100003E00	; loading a 64 bit immidiate to rax, bits for white spaces,'+' and '-' are set
			mov qword[rcx], rax		; loading the value to rcx
			xor rax, rax			; init rax
		check_base:
			xor rdx, rdx			; mov 0 to rdx
			mov rdi, 1				; mov 1 to rdi
			cmp byte [rsi + rax], 0	; check if we reached the end of the string (base)
			je	next_step			; jmp to making the number
			mov bl, byte[rsi + rax]	; moving the character to bl
			cmp bl, 64				; comparing bl to 64
			jbe	check_them			; jump to checking for double characters
			sub	bl, 64				; subtruct 64 from the character if it's bigger than 64
			mov rdx, 8				; if number is bigger than 64 we'll check the 2nd part of l
			check_them:
				push rcx			; we need to use cl to shift, so we'll save it's corrent value
				mov	cl, bl			; moving bl to cl
				shl rdi, cl			; shift rdi, by the value in cl
				pop rcx				; restoring rcx
				push rdi			; saving rdi
				and	rdi, qword [rcx + rdx]	; and operation on rdi and the value pointed to by rcx + rdx and store it in rdi
				pop rbx						; restoring rdi to rbx
				cmp rdi, rbx				; comparing both values
				je	err						; jump to err if equal (meaning there is double)
				or	qword [rcx + rdx], rbx	; if no error is in we will set the bit
				inc	rax						; inc rax
				jmp check_base				; continue the loop untill we end the base
		next_step:
		cmp rax, 2							; checking the len of the base
		jl err								; jmp to err if there is less than 2 elements
		pop rdi								; restoring rdi
		mov rcx, rax						; moving the len to rcx
		xor rax, rax						; init rax with 0
		loopu:
			cmp byte[rdi], 0				; check if we finish the number
			je	end							; ending and returning the number
			mul rcx							; multiply rax by rcx and store it in rax
			xor rbx, rbx					; init rbx to 0
			push rax						; saving rax
			mov al, [rdi]					; moving to al the value in rdi
			get_ind:
				cmp byte [rsi + rbx], 0		; check if we reached the end of the base
				je err_2					; jmp to err_2 because we didn't find the element
				cmp byte [rsi + rbx], al	; comparing the element in al to the one in the base
				je	continue				; if there is we continue to the next step
				inc	rbx						; inc rbx
				jmp get_ind					; continue the loop
			continue:
			pop rax							; restoring rax
			add rax, rbx					; adding rbx to rax and store it to rax
			inc rdi							; inc rdi
			jmp loopu						; continue the loop
		end:
		pop rbx								; restoring rbx
		ret									; return
		err:
			mov rax, -1						; in case of err in the base return -1
			pop rdi							; restoring rdi
			pop rbx							; restoring rbx
			ret								; return
		err_2
			pop rax							; restoring rax
			pop rbx							; restoring rbx
			mov rax, -2						; in case of error in the element of the number return -2
			ret								; return
section	.data
	l times 2 dq 0							; define a 2 * (8 bytes) variable called l
; How does it work:
; -> to check doubles in the base i went with the approach get a chunk of memory that can hold 128 bit (for ascii), so we will have a bit for each character.
; 	-> so making 2 * (8 bytes) = 128, I can use each 8 bytes at a time to use shift, or, and the And operation, so the first 64 characters will be stored in the 1st
;	8 bytes while the next will be in the 2nd.
;	-> with that approach we will need to to sub 64 from each number bigger than 64.
;	-> simple example:
;		character = 4:
;			rdi = 1 ==> rdi = 1 << 4 ==> rdi = 10000
;			l[0] (size_t) -> l[0] = 00000 ==> l[0] & rdi = 00000 and 00000 != 10000 ==> so there is no double ==> l[0] ! rdi = 10000
;		next time we find character = 4:
;			rdi = 1 ==> rdi = 1 << 4 ==> rdi = 10000
;			l[0] (size_t) -> l[0] = 10000 ==> l[0] & rdi = 10000 and 10000 == 10000 ==> so there is double ==> give error.
;	-> by setting the bits for the white spaces and sign to 1 before starting that will mean it will work with them as doubles and put an error.
; -> getting the actual number will use an easy methode:
;	-> simple example:
;		string = "101"	; base = "01"
;		rax = 0		; rcx = len of the base
;		starting a loop:
;		1st time:
;			--> rax = 0
;			rax *= rcx ==> rax = 0
;			string[0] = '1' => searching for '1' in the base => '1' has the index 1
;			rax += index of string[0] ==> rax += 1
;			rax = 1
;		2nd time:
;			--> rax = 1
;			rax *= rcx ==> rax = 2
;			string[1] = '0' =>searching for '0' in the base => '0' has the index 0
;			rax += index of string[1] ==> rax += 0
;			rax = 2
;		3rd time:
;			--> rax = 2
;			rax *= rcx ==> rax = 4
;			string[2] = '1' =>searching for '1' in the base => '1' has the index 1
;			rax += index of string[2] ==> rax += 1
;			rax = 5
;		4th time:
;			--> rax = 5
;		end of the string return rax