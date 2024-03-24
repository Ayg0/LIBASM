global mergeSortList
extern breakList
extern ft_breakList
extern printList
extern mergeLists

;; rdi => **list ;; rsi => cmp ;; rdx => size ;;
section .text
	mergeSortList:
	sub rsp, 16
	lea rax, [rsp]
	mov qword [rax], 0
	mov qword [rax + 8], 0
	;; check if size > 2
	cmp rdx, 2
	jl fillList
	push rdi
	push rdx
	push rsi
	mov rdi, [rdi] ;; *list
	mov rsi, rdx
	shr rsi, 1 ;; shift right to divid by 2
	push rsi
	mov rdx, rax
	add rax, 8
	mov rcx, rax
	sub rax, 8
	push rax
	call ft_breakList
	pop rax ;; pointer to leftList
	pop rcx ;; size / 2
	pop rsi ;; cmp Func
	mov rdi, rax
	mov rdx, rcx
	push rcx
	push rsi
	push rax
	call mergeSortList
	pop rax
	pop rsi
	pop rcx
	add rax, 8
	mov rdi, rax
	pop rdx
	push rdx
	sub rdx, rcx
	push rsi
	call mergeSortList
	pop rsi
	pop rdx
	pop rdi
		fillList:
		cmp rdx, 2
		jl _RETURN
		mov rcx, rsi
		lea rax, [rsp]
		mov rsi, [rax]
		mov rdx, [rax + 8]
		call mergeLists
		_RETURN:
		add rsp, 16
		ret