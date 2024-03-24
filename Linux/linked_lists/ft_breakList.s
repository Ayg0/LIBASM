global ft_breakList
extern ft_list_push

%macro PUSH_REGISTERS 0
	push r9
	push r10
	push rdx
	push rcx
	push rsi
	push rdi
	push rax
%endmacro

%macro POP_REGISTERS 0
	pop rax
	pop rdi
	pop rsi
	pop rcx
	pop rdx
	pop r10
	pop r9
%endmacro

section .text
	ft_breakList:
		xor rax, rax	; init 0
		mov r10, rdi 	; mov list pointer to r10
		mov r9, rsi		; mov index to r9
		fillLeftList:
			cmp rax, r9	; while rax < r9
			jge	fillRightList
			cmp r10, 0	; and list != NULL
			je	fillRightList
			mov rdi, rdx
			mov rsi, [r10]
			PUSH_REGISTERS
			call ft_list_push
			POP_REGISTERS
			mov r10, [r10 + 8]
			inc rax
			jmp fillLeftList
		fillRightList:
			cmp qword r10, 0
			je _RETURN
			mov rdi, rcx
			mov rsi, [r10]
			PUSH_REGISTERS
			call ft_list_push
			POP_REGISTERS
			mov r10, [r10 + 8]
			jmp fillLeftList
		_RETURN:
			ret
