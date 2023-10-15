global ft_list_last

section .text
    ft_list_last:
        cmp rdi, 0
        je  _return
        count:
            cmp qword [rdi + 8], 0
            je _return
            mov rdi, [rdi + 8]
            jmp count
        _return:
            mov rax, rdi
            ret