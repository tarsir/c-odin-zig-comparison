	.file	"main.c"
	.text
	.p2align 4
	.globl	createNewParticle
	.type	createNewParticle, @function
createNewParticle:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%xmm0, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movsd	%xmm1, 8(%rsp)
	call	GetTime@PLT
	movq	%rbx, (%r12)
	movq	%r12, %rax
	movsd	%xmm0, 8(%r12)
	addsd	8(%rsp), %xmm0
	movsd	%xmm0, 16(%r12)
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	createNewParticle, .-createNewParticle
	.p2align 4
	.globl	drawParticles
	.type	drawParticles, @function
drawParticles:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	2400(%rdi), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rbp, %r12
	movq	%rdi, %rbx
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L5:
	addq	$24, %rbx
	addq	$1, %rbp
	cmpq	%r12, %rbx
	je	.L9
.L6:
	cmpb	$0, 0(%rbp)
	je	.L5
	movdqu	(%rbx), %xmm3
	movq	16(%rbx), %rax
	addq	$24, %rbx
	addq	$1, %rbp
	movsd	-16(%rbx), %xmm4
	movsd	-8(%rbx), %xmm1
	movaps	%xmm3, 16(%rsp)
	movsd	%xmm4, (%rsp)
	movq	%rax, 32(%rsp)
	movsd	%xmm1, 8(%rsp)
	call	GetTime@PLT
	movsd	8(%rsp), %xmm1
	movl	$-13162010, %edi
	movapd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	subsd	(%rsp), %xmm1
	subsd	%xmm2, %xmm0
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	call	Fade@PLT
	movq	16(%rsp), %xmm0
	movss	.LC0(%rip), %xmm1
	movl	%eax, %edi
	call	DrawCircleV@PLT
	cmpq	%r12, %rbx
	jne	.L6
.L9:
	addq	$48, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
	.size	drawParticles, .-drawParticles
	.p2align 4
	.globl	nextFreeParticle
	.type	nextFreeParticle, @function
nextFreeParticle:
.LFB3:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L15:
	addq	$1, %rax
	cmpq	$100, %rax
	je	.L14
.L12:
	cmpb	$0, 2400(%rdi,%rax)
	movl	%eax, %r8d
	jne	.L15
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	movl	$-1, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE3:
	.size	nextFreeParticle, .-nextFreeParticle
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"clearing particle at %d"
	.text
	.p2align 4
	.globl	clearExpiredParticles
	.type	clearExpiredParticles, @function
clearExpiredParticles:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	.LC1(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%ebx, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L18:
	addq	$1, %rbx
	cmpq	$100, %rbx
	je	.L25
.L21:
	cmpb	$0, 2400(%rbp,%rbx)
	je	.L18
	leaq	(%rbx,%rbx,2), %rax
	movsd	16(%rbp,%rax,8), %xmm1
	movsd	%xmm1, 8(%rsp)
	call	GetTime@PLT
	comisd	8(%rsp), %xmm0
	jbe	.L18
	movl	%ebx, %edx
	movq	%r13, %rsi
	movl	$3, %edi
	xorl	%eax, %eax
	call	TraceLog@PLT
	movb	$0, 2400(%rbp,%rbx)
	addq	$1, %rbx
	cmpq	$100, %rbx
	jne	.L21
.L25:
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4:
	.size	clearExpiredParticles, .-clearExpiredParticles
	.section	.rodata.str1.1
.LC3:
	.string	"New peak FPS: %d"
.LC4:
	.string	"FPS: %d"
.LC5:
	.string	"Peak FPS: %d"
	.text
	.p2align 4
	.globl	gameLoop
	.type	gameLoop, @function
gameLoop:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	call	GetFPS@PLT
	movl	%eax, %r12d
	call	GetTime@PLT
	comisd	.LC2(%rip), %xmm0
	jbe	.L27
	cmpl	%r12d, 2500(%rbp)
	jl	.L39
.L27:
	movl	%r12d, %esi
	leaq	.LC4(%rip), %rdi
	xorl	%eax, %eax
	call	TextFormat@PLT
	movl	2500(%rbp), %esi
	leaq	.LC5(%rip), %rdi
	movq	%rax, %r13
	xorl	%eax, %eax
	call	TextFormat@PLT
	movl	$-16777216, %r8d
	movl	$20, %ecx
	movq	%r13, %rdi
	movq	%rax, %r12
	movl	$400, %edx
	movl	$500, %esi
	call	DrawText@PLT
	movq	%r12, %rdi
	movl	$-16777216, %r8d
	movl	$20, %ecx
	movl	$440, %edx
	movl	$500, %esi
	call	DrawText@PLT
	xorl	%edi, %edi
	call	IsMouseButtonPressed@PLT
	testb	%al, %al
	jne	.L40
.L29:
	movq	%rbp, %rdi
	call	clearExpiredParticles
	movq	%rbp, %rdi
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	drawParticles
	.p2align 4,,10
	.p2align 3
.L40:
	.cfi_restore_state
	call	GetMousePosition@PLT
	movq	%xmm0, %r12
	call	GetTime@PLT
	xorl	%eax, %eax
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L41:
	addq	$1, %rax
	cmpq	$100, %rax
	je	.L29
.L31:
	cmpb	$0, 2400(%rbp,%rax)
	movslq	%eax, %rdx
	jne	.L41
	leaq	(%rdx,%rdx,2), %rax
	leaq	0(%rbp,%rax,8), %rax
	movsd	%xmm0, 8(%rax)
	addsd	.LC6(%rip), %xmm0
	movq	%r12, (%rax)
	movsd	%xmm0, 16(%rax)
	movb	$1, 2400(%rbp,%rdx)
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L39:
	movl	%r12d, 2500(%rbp)
	movl	%r12d, %edx
	movl	$3, %edi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rsi
	call	TraceLog@PLT
	jmp	.L27
	.cfi_endproc
.LFE5:
	.size	gameLoop, .-gameLoop
	.section	.rodata.str1.1
.LC7:
	.string	"C Example"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$900, %esi
	movl	$1440, %edi
	leaq	.LC7(%rip), %rdx
	subq	$2512, %rsp
	.cfi_def_cfa_offset 2528
	movq	%fs:40, %rax
	movq	%rax, 2504(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbx
	movl	$0, 2500(%rsp)
	call	InitWindow@PLT
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L44:
	call	BeginDrawing@PLT
	movl	$-657931, %edi
	call	ClearBackground@PLT
	movq	%rbx, %rdi
	call	gameLoop
	call	EndDrawing@PLT
.L43:
	call	WindowShouldClose@PLT
	testb	%al, %al
	je	.L44
	call	CloseWindow@PLT
	movq	2504(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L47
	addq	$2512, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L47:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1092616192
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC6:
	.long	0
	.long	1073741824
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
