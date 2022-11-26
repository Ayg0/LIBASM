	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_check_base             ## -- Begin function check_base
	.p2align	4, 0x90
_check_base:                            ## @check_base
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	xorl	%esi, %esi
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -40(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	movl	$16, %edx
	callq	_memset
	movl	$0, -44(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	movslq	-44(%rbp), %rcx
	cmpb	$0, (%rax,%rcx)
	je	LBB0_7
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	$0, -48(%rbp)
	movq	-40(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$64, %edx
	jle	LBB0_4
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	$1, -48(%rbp)
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	movq	-40(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$0, -48(%rbp)
	setne	%sil
	xorb	$-1, %sil
	xorb	$-1, %sil
	andb	$1, %sil
	movzbl	%sil, %edi
	imull	$65, %edi, %edi
	subl	%edi, %edx
	movl	%edx, %edx
	movl	%edx, %ecx
                                        ## kill: def $cl killed $rcx
	movl	$1, %eax
	shlq	%cl, %rax
	movq	%rax, -56(%rbp)
	movslq	-48(%rbp), %rax
	movq	-32(%rbp,%rax,8), %rax
	andq	-56(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jne	LBB0_6
## %bb.5:
	leaq	L_.str(%rip), %rsi
	xorl	%eax, %eax
	movb	%al, %cl
	movl	$1, %edi
	movl	$9, %edx
	movb	%cl, %al
	callq	_write
	movl	%eax, %edi
	callq	_exit
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	movq	-56(%rbp), %rax
	movslq	-48(%rbp), %rcx
	orq	-32(%rbp,%rcx,8), %rax
	movq	%rax, -32(%rbp,%rcx,8)
	movl	-44(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -44(%rbp)
	jmp	LBB0_1
LBB0_7:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB0_9
## %bb.8:
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	retq
LBB0_9:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
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
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rsi
	movq	8(%rsi), %rdi
	callq	_check_base
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"ax kadir\n"


.subsections_via_symbols
