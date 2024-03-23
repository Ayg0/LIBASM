global mergeSortList
extern breakList

section .text
	mergeSortList:
	cmp rdx, 2
	jl fillList

		fillList:
	
section	.data
leftList: .quad 0
rightList: .quad 0