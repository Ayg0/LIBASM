global mergeSortList
extern breakList
extern printList

;; rdi => **list ;; rsi => cmp ;; rdx => size ;;
section .text
	mergeSortList:
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
	mov rdx, [rel leftListAddress]
	mov rcx, [rel rightListAddress]
	call breakList
	pop rsi ;; free the stack finish later
	pop rdx ;; free the stack finish later
	pop rax ;; free the stack finish later
	pop rdi ;; free the stack finish later
	
		fillList:
		mov rdi, [rdi]
		call printList
		mov rdi, [rel leftList]
		call printList
		mov rdi, [rel rightList]
		call printList
		ret
section	.data
leftList dq 0
rightList dq 0
leftListAddress dq leftList
rightListAddress dq rightList