global ft_create_elem
extern malloc
section .text
    ft_create_elem:
        push rdi
        mov  rdi, 16
        call malloc wrt ..plt
        jc  _pop_rdi
        pop rdi
        mov qword [rax], rdi
        mov qword [rax + 8], 0
        jmp _return
    _pop_rdi:
        pop rdi
    _return:
        ret