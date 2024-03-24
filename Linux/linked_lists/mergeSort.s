global mergeSortList
extern breakList
extern printList

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
	push rsi
	push rdx
	mov rdi, [rdi] ;; *list
	mov rsi, rdx
	shr rsi, 1 ;; shift right to divid by 2
	push rsi
	mov rdx, rax
	add rax, 8
	mov rcx, rax
	call breakList
	pop rax ;; size / 2
	pop rdx ;; size
	pop rsi ;; cmp Func
	pop rdi ;; free the stack finish later
		fillList:
		mov rdi, [rdi]
		call printList
		lea rax, [rsp]
		mov rdi, [rax]
		call printList
		lea rax, [rsp]
		mov rdi, [rax + 8]
		call printList
		add rsp, 16
		ret