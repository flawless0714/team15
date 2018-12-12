	.file	"5_13.c"
	.text
	.globl	create_double_array
	.type	create_double_array, @function
create_double_array:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movq	-24(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	$0, -16(%rbp)
	jmp	.L4
.L5:
	call	rand@PLT
	cvtsi2ss	%eax, %xmm0
	movss	.LC0(%rip), %xmm1
	divss	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	cvtss2sd	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -16(%rbp)
.L4:
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jb	.L5
	movq	-8(%rbp), %rax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	create_double_array, .-create_double_array
	.section	.rodata
	.align 8
.LC2:
	.string	"For %ld-Dimensional Vector Dot Product. Cycle = %f\n"
.LC3:
	.string	"CPE = %f\n"
	.text
	.globl	inner4
	.type	inner4, @function
inner4:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -16(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$0, %eax
	call	start_comp_counter@PLT
	movq	$0, -40(%rbp)
	jmp	.L7
.L8:
	movq	-40(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movq	-40(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	addq	$1, -40(%rbp)
.L7:
	movq	-40(%rbp), %rax
	cmpq	-72(%rbp), %rax
	jl	.L8
	movl	$0, %eax
	call	get_comp_counter@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	cvtsi2sdq	-72(%rbp), %xmm0
	movsd	-8(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm2
	movss	%xmm2, -44(%rbp)
	movq	-8(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, -80(%rbp)
	movsd	-80(%rbp), %xmm0
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	cvtss2sd	-44(%rbp), %xmm0
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movss	-44(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	inner4, .-inner4
	.section	.rodata
.LC4:
	.string	"w"
.LC5:
	.string	"file.txt"
.LC6:
	.string	"Error opening file!"
.LC7:
	.string	"%llu   %lu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	leaq	.LC4(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L11
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L11:
	movq	$10, -32(%rbp)
	movq	$1000, -24(%rbp)
	movq	$1, -64(%rbp)
	jmp	.L12
.L15:
	movq	$0, -56(%rbp)
	movq	$1, -48(%rbp)
	jmp	.L13
.L14:
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	create_double_array
	movq	%rax, -16(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	create_double_array
	movq	%rax, -8(%rbp)
	movq	-64(%rbp), %rdx
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	inner4
	cvttss2siq	%xmm0, %rax
	addq	%rax, -56(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	addq	$1, -48(%rbp)
.L13:
	movq	-48(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jbe	.L14
	movq	-56(%rbp), %rax
	movl	$0, %edx
	divq	-32(%rbp)
	movq	%rax, -56(%rbp)
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-40(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$1, -64(%rbp)
.L12:
	movq	-64(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jbe	.L15
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1269028618
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
