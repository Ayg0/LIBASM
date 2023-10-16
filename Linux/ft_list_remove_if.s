global ft_list_remove_if
extern free

%macro PUSH_REGISTERS 0
	push r10
	push r9
	push r8
	push rdx
	push rcx
	push rsi
	push rdi
%endmacro

%macro POP_REGISTERS 0
	pop rdi
	pop rsi
	pop rcx
	pop rdx
	pop r8
	pop r9
	pop r10
%endmacro
section .text
	ft_list_remove_if:
		cmp rdi, 0
		mov r8, 0
		mov r10, [rdi]
		je	_return
		loopList:
			cmp r10, 0
			je _return
			PUSH_REGISTERS
			mov rdi, [r10]
			call rdx
			POP_REGISTERS
			cmp rax, 0
			jne	progressLoop
			mov r9, [r10 + 8]
			cmp r8, 0
			jne getNewNext
			mov [rdi], r9
			jmp deleteNode
			getNewNext:
				mov [r8 + 8], r9
			deleteNode:
				PUSH_REGISTERS
				mov rdi, [r10]
				call rcx
				POP_REGISTERS
				PUSH_REGISTERS
				mov rdi, r10
				call free wrt ..plt
				POP_REGISTERS
				mov r10, r9
				jmp loopList
			progressLoop:
				cmp r10, 0
				je _return
				mov r8, r10
				mov r10, [r8 + 8]
				jmp loopList
		_return:
			ret


	; t_list *prev = NULL; r8
	; t_list *tmp = NULL; r9
	; t_list *list = *begin_list; r10
	; while (list)
	; {
		; if (!cmp(list->data, data_ref)){
			; if (prev)
				; prev->next = list->next;
			; else
				; *begin_list = list->next;
			; tmp = list->next;
			; free_fct(list->data);
			; free(list);
			; list = tmp;
		; }
		; if (!list)
			; return ;
		; prev = list;
		; list = list->next;
	; }
