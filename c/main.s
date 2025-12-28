	.file	"main.c"
	.text
	.globl	createNewParticle
	.type	createNewParticle, @function
createNewParticle:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%xmm0, -64(%rbp)
	movsd	%xmm1, -72(%rbp)
	call	GetTime@PLT
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -32(%rbp)
	movsd	-40(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-40(%rbp), %xmm0
	addsd	-72(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movq	-56(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	movq	-16(%rbp), %rax
	movq	%rax, 16(%rcx)
	movq	-56(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	createNewParticle, .-createNewParticle
	.section	.rodata
.LC0:
	.string	"C Example"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$2552, %rsp
	.cfi_offset 3, -24
	movl	%edi, -2548(%rbp)
	movq	%rsi, -2560(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$1440, -2536(%rbp)
	movl	$900, -2532(%rbp)
	movl	$0, -28(%rbp)
	movl	-2532(%rbp), %ecx
	movl	-2536(%rbp), %eax
	leaq	.LC0(%rip), %rdx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	InitWindow@PLT
	jmp	.L4
.L5:
	call	BeginDrawing@PLT
	movb	$-11, %bl
	movl	$-11, %eax
	movb	%al, %bh
	movl	%ebx, %eax
	andl	$-16711681, %eax
	orl	$16056320, %eax
	movl	%eax, %ebx
	movl	%ebx, %eax
	orl	$-16777216, %eax
	movl	%eax, %ebx
	movl	%ebx, %edi
	call	ClearBackground@PLT
	leaq	-2528(%rbp), %rax
	movq	%rax, %rdi
	call	gameLoop
	call	EndDrawing@PLT
.L4:
	call	WindowShouldClose@PLT
	xorl	$1, %eax
	testb	%al, %al
	jne	.L5
	call	CloseWindow@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	drawParticles
	.type	drawParticles, @function
drawParticles:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movl	$0, -56(%rbp)
	jmp	.L9
.L11:
	movq	-72(%rbp), %rdx
	movl	-56(%rbp), %eax
	cltq
	movzbl	2400(%rdx,%rax), %eax
	testb	%al, %al
	je	.L10
	movq	-72(%rbp), %rcx
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rax, %rcx
	movq	(%rcx), %rax
	movq	8(%rcx), %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	16(%rcx), %rax
	movq	%rax, -32(%rbp)
	movsd	-32(%rbp), %xmm3
	movsd	%xmm3, -80(%rbp)
	call	GetTime@PLT
	movapd	%xmm0, %xmm1
	movsd	-80(%rbp), %xmm0
	subsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	movsd	-40(%rbp), %xmm2
	subsd	%xmm2, %xmm1
	divsd	%xmm1, %xmm0
	pxor	%xmm4, %xmm4
	cvtsd2ss	%xmm0, %xmm4
	movd	%xmm4, %eax
	movb	$-26, %bl
	movl	$41, %edx
	movb	%dl, %bh
	andl	$-16711681, %ebx
	movl	%ebx, %edx
	orl	$3604480, %edx
	movl	%edx, %ebx
	orl	$-16777216, %ebx
	movl	%ebx, %edx
	movl	%edx, %ebx
	movd	%eax, %xmm0
	movl	%ebx, %edi
	call	Fade@PLT
	movl	%eax, -52(%rbp)
	movl	-52(%rbp), %eax
	movq	-48(%rbp), %rdx
	movl	%eax, %edi
	movss	.LC1(%rip), %xmm1
	movq	%rdx, %xmm0
	call	DrawCircleV@PLT
.L10:
	addl	$1, -56(%rbp)
.L9:
	cmpl	$99, -56(%rbp)
	jle	.L11
	nop
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	drawParticles, .-drawParticles
	.globl	nextFreeParticle
	.type	nextFreeParticle, @function
nextFreeParticle:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$-1, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L13
.L16:
	movq	-24(%rbp), %rdx
	movl	-4(%rbp), %eax
	cltq
	movzbl	2400(%rdx,%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L14
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.L15
.L14:
	addl	$1, -4(%rbp)
.L13:
	cmpl	$99, -4(%rbp)
	jle	.L16
.L15:
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	nextFreeParticle, .-nextFreeParticle
	.section	.rodata
.LC2:
	.string	"clearing particle at %d"
	.text
	.globl	clearExpiredParticles
	.type	clearExpiredParticles, @function
clearExpiredParticles:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L19
.L23:
	movq	-56(%rbp), %rdx
	movl	-36(%rbp), %eax
	cltq
	movzbl	2400(%rdx,%rax), %eax
	testb	%al, %al
	je	.L20
	movq	-56(%rbp), %rcx
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rax, %rcx
	movq	(%rcx), %rax
	movq	8(%rcx), %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	16(%rcx), %rax
	movq	%rax, -16(%rbp)
	movsd	-16(%rbp), %xmm1
	movsd	%xmm1, -64(%rbp)
	call	GetTime@PLT
	movq	%xmm0, %rax
	movq	%rax, %xmm2
	comisd	-64(%rbp), %xmm2
	jbe	.L20
	movl	-36(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	movl	$3, %edi
	movl	$0, %eax
	call	TraceLog@PLT
	movq	-56(%rbp), %rdx
	movl	-36(%rbp), %eax
	cltq
	movb	$0, 2400(%rdx,%rax)
.L20:
	addl	$1, -36(%rbp)
.L19:
	cmpl	$99, -36(%rbp)
	jle	.L23
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	clearExpiredParticles, .-clearExpiredParticles
	.section	.rodata
.LC4:
	.string	"New peak FPS: %d"
.LC5:
	.string	"FPS: %d"
.LC6:
	.string	"Peak FPS: %d"
	.text
	.globl	gameLoop
	.type	gameLoop, @function
gameLoop:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	call	GetFPS@PLT
	movl	%eax, -80(%rbp)
	call	GetTime@PLT
	movq	%xmm0, %rax
	movsd	.LC3(%rip), %xmm0
	movq	%rax, %xmm2
	comisd	%xmm0, %xmm2
	jbe	.L26
	movq	-88(%rbp), %rax
	movl	2500(%rax), %eax
	cmpl	%eax, -80(%rbp)
	jle	.L26
	movq	-88(%rbp), %rax
	movl	-80(%rbp), %edx
	movl	%edx, 2500(%rax)
	movl	-80(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rsi
	movl	$3, %edi
	movl	$0, %eax
	call	TraceLog@PLT
.L26:
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movl	-80(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	TextFormat@PLT
	movq	%rax, -72(%rbp)
	movq	-88(%rbp), %rax
	movl	2500(%rax), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	TextFormat@PLT
	movq	%rax, -64(%rbp)
	movl	-92(%rbp), %ecx
	movb	$0, %cl
	movl	$0, %eax
	movb	%al, %ch
	andl	$-16711681, %ecx
	movl	%ecx, %eax
	orl	$-16777216, %eax
	movl	%eax, %edx
	movq	-72(%rbp), %rax
	movl	%edx, %r8d
	movl	$20, %ecx
	movl	$400, %edx
	movl	$500, %esi
	movq	%rax, %rdi
	call	DrawText@PLT
	movb	$0, %bl
	movl	$0, %eax
	movb	%al, %bh
	movl	%ebx, %eax
	andl	$-16711681, %eax
	movl	%eax, %ebx
	movl	%ebx, %eax
	orl	$-16777216, %eax
	movl	%eax, %ebx
	movq	-64(%rbp), %rax
	movl	%ebx, %r8d
	movl	$20, %ecx
	movl	$440, %edx
	movl	$500, %esi
	movq	%rax, %rdi
	call	DrawText@PLT
	movl	$0, %edi
	call	IsMouseButtonPressed@PLT
	testb	%al, %al
	je	.L28
	call	GetMousePosition@PLT
	movq	%xmm0, %rax
	movq	%rax, -56(%rbp)
	leaq	-48(%rbp), %rax
	movsd	.LC7(%rip), %xmm0
	movq	-56(%rbp), %rdx
	movapd	%xmm0, %xmm1
	movq	%rdx, %xmm0
	movq	%rax, %rdi
	call	createNewParticle
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	nextFreeParticle
	movl	%eax, -76(%rbp)
	cmpl	$0, -76(%rbp)
	js	.L28
	movq	-88(%rbp), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rax, %rcx
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	movq	-32(%rbp), %rax
	movq	%rax, 16(%rcx)
	movq	-88(%rbp), %rdx
	movl	-76(%rbp), %eax
	cltq
	movb	$1, 2400(%rdx,%rax)
.L28:
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	clearExpiredParticles
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	drawParticles
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L30
	call	__stack_chk_fail@PLT
.L30:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	gameLoop, .-gameLoop
	.section	.rodata
	.align 4
.LC1:
	.long	1092616192
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC7:
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
