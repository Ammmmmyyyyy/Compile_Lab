	.text
	.file	"sum_array.c"
	.globl	sum_array                       # -- Begin function sum_array
	.p2align	4, 0x90
	.type	sum_array,@function
sum_array:                              # @sum_array
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$0, -4(%rsp)
	movl	$0, -8(%rsp)
	cmpl	%esi, -8(%rsp)
	jge	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop_body
                                        # =>This Inner Loop Header: Depth=1
	movslq	-8(%rsp), %rax
	movl	(%rdi,%rax,4), %ecx
	addl	%ecx, -4(%rsp)
	incl	%eax
	movl	%eax, -8(%rsp)
	cmpl	%esi, -8(%rsp)
	jl	.LBB0_2
.LBB0_3:                                # %loop_end
	movl	-4(%rsp), %eax
	retq
.Lfunc_end0:
	.size	sum_array, .Lfunc_end0-sum_array
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	4(%rsp), %rsi
	movl	$.L.str1, %edi
	xorl	%eax, %eax
	callq	scanf@PLT
	movl	4(%rsp), %ebx
	leal	(,%rbx,4), %edi
	callq	malloc@PLT
	movq	%rax, 8(%rsp)
	movl	$0, (%rsp)
	cmpl	%ebx, (%rsp)
	jge	.LBB1_3
	.p2align	4, 0x90
.LBB1_2:                                # %loop_body
                                        # =>This Inner Loop Header: Depth=1
	movslq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movl	%eax, (%rcx,%rax,4)
	incl	%eax
	movl	%eax, (%rsp)
	cmpl	%ebx, (%rsp)
	jl	.LBB1_2
.LBB1_3:                                # %loop_end
	movq	8(%rsp), %rdi
	movl	4(%rsp), %esi
	callq	sum_array@PLT
	movl	%eax, 20(%rsp)
	movl	$.L.str2, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	8(%rsp), %rdi
	callq	free@PLT
	xorl	%eax, %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\350\257\267\350\276\223\345\205\245\344\270\200\344\270\252\346\225\260\345\255\227\357\274\232"
	.size	.L.str, 25

	.type	.L.str1,@object                 # @.str1
.L.str1:
	.asciz	"%d"
	.size	.L.str1, 3

	.type	.L.str2,@object                 # @.str2
.L.str2:
	.asciz	"%d\n"
	.size	.L.str2, 4

	.section	".note.GNU-stack","",@progbits
