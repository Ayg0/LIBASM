global ft_freeList
extern free

%macro PUSH_REGISTERS 0
	push rdi
	push rax
%endmacro

%macro POP_REGISTERS 0
	pop rax
	pop rdi
%endmacro

section .text
	ft_freeList:
	push rdi	;; keep **list
	mov rdi, [rdi] ;; rdi -> *list
	freeNodes:
		cmp rdi, 0	;; while *list
		je _RETURN
		mov rax, rdi ;; rax -> *list
		mov rcx, [rdi]
		mov rdi, rcx ;; rdi -> data
		PUSH_REGISTERS
		call free wrt ..plt
		POP_REGISTERS
		mov rdi, rax ;; rdi -> *list
		PUSH_REGISTERS
		call free wrt ..plt
		POP_REGISTERS
		mov rdi, [rax + 8] ;; rdi -> list->next
		jmp freeNodes
	_RETURN:
		pop rdi
		;mov rcx, [rax + 8]
		;mov [rdi], rcx
		mov qword [rdi], 0
		ret