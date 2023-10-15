global ft_list_size

section .text
    ft_list_size:
        xor rax, rax
        count:
            cmp rdi, 0
            je _return
            inc rax
            mov rdi, [rdi + 8]
            jmp count
        _return:
            ret