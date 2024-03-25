global ft_mergeLists
extern ft_freeList
%macro PUSH_REGISTERS 0
	push rdi
	push rsi
	push rdx
	push rcx
	push r10
%endmacro

%macro POP_REGISTERS 0
	pop r10
	pop rcx
	pop rdx
	pop rsi
	pop rdi
%endmacro

section .text
	; rdi -> **list     ;; rsi -> *leftList 
	; rdx -> *rightList ;; rcx -> cmp Func
	ft_mergeLists:
		mov r10, [rdi]	;; r10 = *list
		push r10
		FillLoop:
			cmp rsi, 0	;; while leftList
			je CheckForUnused
			cmp rdx, 0  ;; and rightList
			je CheckForUnused
			PUSH_REGISTERS
			mov rdi, rsi
			mov rsi, rdx
			call rcx	;; check if left Bigger
			POP_REGISTERS
			cmp rax, 0
			je getLeft
			mov r9, [rdx]
			mov [r10], r9
			mov rdx, [rdx + 8]
			jmp incList
		getLeft:
			mov r9, [rsi]
			mov [r10], r9
			mov rsi, [rsi + 8]
		incList:
			mov r10, [r10 + 8]
			jmp FillLoop
		CheckForUnused:
			fillLeftLoop:
				cmp rsi, 0	;; while leftList
				je fillRightLoop
				mov r9, [rsi]
				mov [r10], r9
				mov rsi, [rsi + 8]
				mov r10, [r10 + 8]
				jmp fillLeftLoop
			fillRightLoop:
				cmp rdx, 0  ;; while rightList
				je _RETURN
				mov r9, [rdx]
				mov [r10], r9
				mov rdx, [rdx + 8]
				mov r10, [r10 + 8]
				jmp fillRightLoop
			_RETURN:
				pop r9
				mov r10, r9
				ret