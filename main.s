	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	xorl	%eax, %eax
	movl	%eax, %ecx
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	L___const.main.i(%rip), %eax
	movl	%eax, -20(%rbp)
	leaq	L_.str(%rip), %rdi
	movq	%rcx, %rsi
	callq	_ft_atoi_base
	xorl	%edx, %edx
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	movl	%edx, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## @__const.main.i
L___const.main.i:
	.long	5                       ## 0x5

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"55"


.subsections_via_symbols
