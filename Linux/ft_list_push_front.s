global ft_list_push_front
extern ft_create_elem
extern malloc
; struc s_list
;     data resq 1
;     next resq 1
; endstruc

section .text
    ft_list_push_front:
        push rdi
        mov rdi, rsi
        call ft_create_elem
        cmp rax, 0
        je allocationFail
        pop rdi
        mov r8, [rdi]
        mov [rax + 8], r8
        mov [rdi], rax
        ret
    allocationFail:
        pop rdi
        ret