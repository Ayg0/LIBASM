global ft_atoi_base
section .data
	asciiFlags times 2 dq 0
section .text
	ft_atoi_base:
		mov rax, 1
		ret
		
; -1 	str or base are null
; -2 	Base elements error
; -3	Base Size error
