	.text
	.file	"test2.ll"
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
	subq	$424, %rsp                      # imm = 0x1A8
	.cfi_def_cfa_offset 432
	movl	$10, 8(%rsp)
	movl	$10, %eax
	movl	$0, 4(%rsp)
	cmpl	%eax, 4(%rsp)
	jge	.LBB1_3
	.p2align	4, 0x90
.LBB1_2:                                # %loop_body
                                        # =>This Inner Loop Header: Depth=1
	movslq	4(%rsp), %rcx
	movl	%ecx, 16(%rsp,%rcx,4)
	incl	%ecx
	movl	%ecx, 4(%rsp)
	cmpl	%eax, 4(%rsp)
	jl	.LBB1_2
.LBB1_3:                                # %loop_end
	movl	8(%rsp), %esi
	leaq	16(%rsp), %rdi
	callq	sum_array@PLT
	movl	%eax, 12(%rsp)
	addq	$424, %rsp                      # imm = 0x1A8
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str2,@object                 # @.str2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str2:
	.asciz	"%d\n"
	.size	.L.str2, 4

	.section	".note.GNU-stack","",@progbits
