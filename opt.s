	.file	"5_13.c"
	.text
	.p2align 4,,15
	.globl	create_double_array
	.type	create_double_array, @function
create_double_array:
.LFB41:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	xorl	%edi, %edi
	leaq	0(,%rbx,8), %rbp
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movq	%rbp, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L1
	testq	%rbx, %rbx
	je	.L1
	movq	%rax, %rbx
	addq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	addq	$8, %rbx
	cvtsi2ss	%eax, %xmm0
	divss	.LC0(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbx)
	cmpq	%rbp, %rbx
	jne	.L3
.L1:
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE41:
	.size	create_double_array, .-create_double_array
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"For %ld-Dimensional Vector Dot Product. Cycle = %f\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"CPE = %f\n"
	.text
	.p2align 4,,15
	.globl	inner4
	.type	inner4, @function
inner4:
.LFB42:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	movq	%rdx, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	call	start_comp_counter@PLT
	xorl	%eax, %eax
	call	get_comp_counter@PLT
	pxor	%xmm1, %xmm1
	leaq	.LC1(%rip), %rsi
	movapd	%xmm0, %xmm2
	movq	%rbx, %rdx
	pxor	%xmm3, %xmm3
	movl	$1, %edi
	cvtsi2sdq	%rbx, %xmm1
	movl	$1, %eax
	divsd	%xmm1, %xmm2
	cvtsd2ss	%xmm2, %xmm3
	movss	%xmm3, 12(%rsp)
	call	__printf_chk@PLT
	pxor	%xmm0, %xmm0
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	cvtss2sd	12(%rsp), %xmm0
	call	__printf_chk@PLT
	movss	12(%rsp), %xmm0
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE42:
	.size	inner4, .-inner4
	.section	.rodata.str1.1
.LC3:
	.string	"w"
.LC4:
	.string	"file.txt"
.LC5:
	.string	"Error opening file!"
.LC6:
	.string	"%llu   %lu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB43:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC3(%rip), %rsi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC4(%rip), %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	fopen@PLT
	testq	%rax, %rax
	je	.L22
	movq	%rax, %r14
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L16:
	movl	$10, %ebp
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%rbx, %rdi
	call	create_double_array
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	create_double_array
	movq	%rbx, %rdx
	movq	%rax, %rsi
	movq	%r12, %rdi
	movq	%rax, %r15
	call	inner4
	cvttss2siq	%xmm0, %rdx
	movq	%r12, %rdi
	addq	%rdx, %r13
	call	free@PLT
	movq	%r15, %rdi
	call	free@PLT
	subq	$1, %rbp
	jne	.L17
	movabsq	$-3689348814741910323, %rax
	movq	%rbx, %r8
	movl	$1, %esi
	mulq	%r13
	movq	%r14, %rdi
	xorl	%eax, %eax
	addq	$1, %rbx
	movq	%rdx, %rcx
	leaq	.LC6(%rip), %rdx
	shrq	$3, %rcx
	call	__fprintf_chk@PLT
	cmpq	$1001, %rbx
	jne	.L16
	movq	%r14, %rdi
	call	fclose@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L22:
	.cfi_restore_state
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE43:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1269028618
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
