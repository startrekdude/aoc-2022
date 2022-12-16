	.text
	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.intel_syntax noprefix
	.file	"solve.c"
	.def	bruteforce6;
	.scl	2;
	.type	32;
	.endef
	.globl	bruteforce6                     # -- Begin function bruteforce6
	.p2align	4, 0x90
bruteforce6:                            # @bruteforce6
# %bb.0:
	push	r15
	push	r14
	push	r13
	push	r12
	push	rsi
	push	rdi
	push	rbp
	push	rbx
	sub	rsp, 136
	mov	r11d, ecx
	movsxd	rax, ecx
	lea	r13, [rsp + rax]
	add	r13, 34
	mov	edx, 6
	sub	edx, eax
	mov	qword ptr [rsp + 128], rdx      # 8-byte Spill
	xor	edx, edx
	lea	r15, [rip + values]
	mov	dword ptr [rsp + 40], 0         # 4-byte Folded Spill
	mov	dword ptr [rsp + 44], ecx       # 4-byte Spill
	mov	qword ptr [rsp + 64], r11       # 8-byte Spill
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_1:                                #   in Loop: Header=BB0_2 Depth=1
	inc	rdx
	cmp	rdx, 6
	je	.LBB0_46
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
                                        #       Child Loop BB0_7 Depth 3
                                        #         Child Loop BB0_11 Depth 4
                                        #           Child Loop BB0_16 Depth 5
                                        #             Child Loop BB0_23 Depth 6
                                        #               Child Loop BB0_30 Depth 7
                                        #               Child Loop BB0_37 Depth 7
	mov	byte ptr [rsp + 34], dl
	movzx	eax, dl
	mov	qword ptr [rsp + 80], rax       # 8-byte Spill
	xor	eax, eax
	mov	qword ptr [rsp + 72], rdx       # 8-byte Spill
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=2
	inc	al
	cmp	al, 6
	je	.LBB0_1
.LBB0_4:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_7 Depth 3
                                        #         Child Loop BB0_11 Depth 4
                                        #           Child Loop BB0_16 Depth 5
                                        #             Child Loop BB0_23 Depth 6
                                        #               Child Loop BB0_30 Depth 7
                                        #               Child Loop BB0_37 Depth 7
	movzx	ebp, al
	cmp	rdx, rbp
	je	.LBB0_3
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=2
	mov	byte ptr [rsp + 35], al
	xor	ebx, ebx
	mov	dword ptr [rsp + 48], eax       # 4-byte Spill
	mov	qword ptr [rsp + 88], rbp       # 8-byte Spill
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=3
	inc	bl
	cmp	bl, 6
	je	.LBB0_3
.LBB0_7:                                #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_11 Depth 4
                                        #           Child Loop BB0_16 Depth 5
                                        #             Child Loop BB0_23 Depth 6
                                        #               Child Loop BB0_30 Depth 7
                                        #               Child Loop BB0_37 Depth 7
	cmp	bl, al
	je	.LBB0_6
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=3
	movzx	edi, bl
	mov	rbp, rdi
	mov	qword ptr [rsp + 96], rdi       # 8-byte Spill
	cmp	rdx, rdi
	je	.LBB0_6
# %bb.9:                                #   in Loop: Header=BB0_7 Depth=3
	mov	byte ptr [rsp + 36], bl
	xor	ebp, ebp
	mov	dword ptr [rsp + 52], ebx       # 4-byte Spill
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=4
	inc	bpl
	cmp	bpl, 6
	je	.LBB0_6
.LBB0_11:                               #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        #       Parent Loop BB0_7 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB0_16 Depth 5
                                        #             Child Loop BB0_23 Depth 6
                                        #               Child Loop BB0_30 Depth 7
                                        #               Child Loop BB0_37 Depth 7
	cmp	bpl, bl
	je	.LBB0_10
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=4
	cmp	bpl, al
	je	.LBB0_10
# %bb.13:                               #   in Loop: Header=BB0_11 Depth=4
	movzx	esi, bpl
	mov	rdi, rsi
	mov	qword ptr [rsp + 104], rsi      # 8-byte Spill
	cmp	rdx, rsi
	je	.LBB0_10
# %bb.14:                               #   in Loop: Header=BB0_11 Depth=4
	mov	byte ptr [rsp + 37], bpl
	xor	edi, edi
	mov	dword ptr [rsp + 56], ebp       # 4-byte Spill
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_15:                               #   in Loop: Header=BB0_16 Depth=5
	inc	dil
	cmp	dil, 6
	je	.LBB0_10
.LBB0_16:                               #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        #       Parent Loop BB0_7 Depth=3
                                        #         Parent Loop BB0_11 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB0_23 Depth 6
                                        #               Child Loop BB0_30 Depth 7
                                        #               Child Loop BB0_37 Depth 7
	cmp	dil, bpl
	je	.LBB0_15
# %bb.17:                               #   in Loop: Header=BB0_16 Depth=5
	cmp	dil, bl
	je	.LBB0_15
# %bb.18:                               #   in Loop: Header=BB0_16 Depth=5
	cmp	dil, al
	je	.LBB0_15
# %bb.19:                               #   in Loop: Header=BB0_16 Depth=5
	movzx	r8d, dil
	mov	rsi, r8
	mov	qword ptr [rsp + 112], r8       # 8-byte Spill
	cmp	rdx, r8
	je	.LBB0_15
# %bb.20:                               #   in Loop: Header=BB0_16 Depth=5
	mov	byte ptr [rsp + 38], dil
	xor	r14d, r14d
	mov	dword ptr [rsp + 60], edi       # 4-byte Spill
	jmp	.LBB0_23
	.p2align	4, 0x90
.LBB0_21:                               #   in Loop: Header=BB0_23 Depth=6
	mov	rdx, qword ptr [rsp + 72]       # 8-byte Reload
	mov	eax, dword ptr [rsp + 48]       # 4-byte Reload
	mov	ebx, dword ptr [rsp + 52]       # 4-byte Reload
	mov	ebp, dword ptr [rsp + 56]       # 4-byte Reload
	mov	edi, dword ptr [rsp + 60]       # 4-byte Reload
.LBB0_22:                               #   in Loop: Header=BB0_23 Depth=6
	inc	r14b
	cmp	r14b, 6
	je	.LBB0_15
.LBB0_23:                               #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        #       Parent Loop BB0_7 Depth=3
                                        #         Parent Loop BB0_11 Depth=4
                                        #           Parent Loop BB0_16 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB0_30 Depth 7
                                        #               Child Loop BB0_37 Depth 7
	cmp	r14b, dil
	je	.LBB0_22
# %bb.24:                               #   in Loop: Header=BB0_23 Depth=6
	cmp	r14b, bpl
	je	.LBB0_22
# %bb.25:                               #   in Loop: Header=BB0_23 Depth=6
	cmp	r14b, bl
	je	.LBB0_22
# %bb.26:                               #   in Loop: Header=BB0_23 Depth=6
	cmp	r14b, al
	je	.LBB0_22
# %bb.27:                               #   in Loop: Header=BB0_23 Depth=6
	movzx	esi, r14b
	cmp	rdx, rsi
	je	.LBB0_22
# %bb.28:                               #   in Loop: Header=BB0_23 Depth=6
	lea	rax, [rip + initial_costs]
	movzx	r9d, byte ptr [rdx + rax]
	inc	r9d
	xor	eax, eax
	mov	byte ptr [rsp + 39], r14b
	movzx	edi, byte ptr [rdx + r15]
	cmp	ecx, 2
	mov	qword ptr [rsp + 120], rsi      # 8-byte Spill
	jl	.LBB0_32
# %bb.29:                               #   in Loop: Header=BB0_23 Depth=6
	xor	r10d, r10d
	mov	ebx, 1
	mov	r8d, edx
	.p2align	4, 0x90
.LBB0_30:                               #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        #       Parent Loop BB0_7 Depth=3
                                        #         Parent Loop BB0_11 Depth=4
                                        #           Parent Loop BB0_16 Depth=5
                                        #             Parent Loop BB0_23 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	movzx	edx, r8b
	movzx	r8d, byte ptr [rsp + rbx + 34]
	movzx	ebp, r8b
	lea	rdx, [rdx + 4*rdx]
	lea	rdx, [rdx + 2*rdx]
	lea	rsi, [rip + costs]
	add	rdx, rsi
	movzx	edx, byte ptr [rbp + rdx]
	lea	esi, [rdx + r9]
	inc	esi
	cmp	esi, 26
	ja	.LBB0_33
# %bb.31:                               #   in Loop: Header=BB0_30 Depth=7
	inc	edx
	imul	edx, edi
	add	edx, r10d
	movzx	ebp, byte ptr [rbp + r15]
	add	edi, ebp
	inc	rbx
	mov	r9d, esi
	mov	r10d, edx
	cmp	r11, rbx
	jne	.LBB0_30
	jmp	.LBB0_35
	.p2align	4, 0x90
.LBB0_32:                               #   in Loop: Header=BB0_23 Depth=6
	xor	edx, edx
	jmp	.LBB0_34
.LBB0_33:                               #   in Loop: Header=BB0_23 Depth=6
	mov	edx, r10d
.LBB0_34:                               #   in Loop: Header=BB0_23 Depth=6
	mov	esi, r9d
.LBB0_35:                               #   in Loop: Header=BB0_23 Depth=6
	mov	r12d, 26
	sub	r12d, esi
	imul	r12d, edi
	movzx	r10d, byte ptr [r13]
	lea	rbp, [rip + initial_costs]
	movzx	r8d, byte ptr [r10 + rbp]
	inc	r8d
	movzx	ebx, byte ptr [r10 + r15]
	cmp	ecx, 4
	jg	.LBB0_41
# %bb.36:                               #   in Loop: Header=BB0_23 Depth=6
	xor	r9d, r9d
	mov	edi, 1
	.p2align	4, 0x90
.LBB0_37:                               #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        #       Parent Loop BB0_7 Depth=3
                                        #         Parent Loop BB0_11 Depth=4
                                        #           Parent Loop BB0_16 Depth=5
                                        #             Parent Loop BB0_23 Depth=6
                                        # =>            This Inner Loop Header: Depth=7
	mov	eax, r10d
	movzx	eax, r10b
	movzx	r10d, byte ptr [r13 + rdi]
	movzx	ebp, r10b
	lea	rax, [rax + 4*rax]
	lea	rax, [rax + 2*rax]
	lea	rsi, [rip + costs]
	add	rax, rsi
	movzx	eax, byte ptr [rbp + rax]
	lea	esi, [rax + r8]
	inc	esi
	cmp	esi, 26
	ja	.LBB0_40
# %bb.38:                               #   in Loop: Header=BB0_37 Depth=7
	inc	eax
	imul	eax, ebx
	add	eax, r9d
	movzx	ebp, byte ptr [rbp + r15]
	add	ebx, ebp
	inc	rdi
	mov	r8d, esi
	mov	r9d, eax
	cmp	qword ptr [rsp + 128], rdi      # 8-byte Folded Reload
	jne	.LBB0_37
	jmp	.LBB0_42
.LBB0_40:                               #   in Loop: Header=BB0_23 Depth=6
	mov	eax, r9d
.LBB0_41:                               #   in Loop: Header=BB0_23 Depth=6
	mov	esi, r8d
.LBB0_42:                               #   in Loop: Header=BB0_23 Depth=6
	mov	ebp, 26
	sub	ebp, esi
	imul	ebp, ebx
	add	r12d, edx
	add	r12d, eax
	add	r12d, ebp
	cmp	r12d, dword ptr [rsp + 40]      # 4-byte Folded Reload
	jle	.LBB0_44
# %bb.43:                               #   in Loop: Header=BB0_23 Depth=6
	lea	rcx, [rip + "??_C@_03PMGGPEJJ@?$CFd?6?$AA@"]
	mov	edx, r12d
	call	printf
	mov	r11, qword ptr [rsp + 64]       # 8-byte Reload
	mov	ecx, dword ptr [rsp + 44]       # 4-byte Reload
	mov	dword ptr [rsp + 40], r12d      # 4-byte Spill
.LBB0_44:                               #   in Loop: Header=BB0_23 Depth=6
	cmp	r12d, 1704
	jne	.LBB0_21
# %bb.45:                               #   in Loop: Header=BB0_23 Depth=6
	lea	rsi, [rip + names]
	mov	rax, qword ptr [rsp + 80]       # 8-byte Reload
	mov	rdx, qword ptr [rsi + 8*rax]
	lea	rdi, [rip + "??_C@_03IKGEINEE@?$CFs?5?$AA@"]
	mov	rcx, rdi
	call	printf
	mov	rax, qword ptr [rsp + 88]       # 8-byte Reload
	mov	rdx, qword ptr [rsi + 8*rax]
	mov	rcx, rdi
	call	printf
	mov	rax, qword ptr [rsp + 96]       # 8-byte Reload
	mov	rdx, qword ptr [rsi + 8*rax]
	mov	rcx, rdi
	call	printf
	mov	rax, qword ptr [rsp + 104]      # 8-byte Reload
	mov	rdx, qword ptr [rsi + 8*rax]
	mov	rcx, rdi
	call	printf
	mov	rax, qword ptr [rsp + 112]      # 8-byte Reload
	mov	rdx, qword ptr [rsi + 8*rax]
	mov	rcx, rdi
	call	printf
	mov	rax, qword ptr [rsp + 120]      # 8-byte Reload
	mov	rdx, qword ptr [rsi + 8*rax]
	mov	rcx, rdi
	call	printf
	mov	ecx, 10
	call	putchar
	mov	r11, qword ptr [rsp + 64]       # 8-byte Reload
	mov	ecx, dword ptr [rsp + 44]       # 4-byte Reload
	jmp	.LBB0_21
.LBB0_46:
	lea	rcx, [rip + "??_C@_03PMGGPEJJ@?$CFd?6?$AA@"]
	mov	edx, dword ptr [rsp + 40]       # 4-byte Reload
	call	printf
	add	rsp, 136
	pop	rbx
	pop	rbp
	pop	rdi
	pop	rsi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
                                        # -- End function
	.def	printf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,printf
	.globl	printf                          # -- Begin function printf
	.p2align	4, 0x90
printf:                                 # @printf
# %bb.0:
	push	rsi
	push	rdi
	push	rbx
	sub	rsp, 48
	mov	rsi, rcx
	mov	qword ptr [rsp + 88], rdx
	mov	qword ptr [rsp + 96], r8
	mov	qword ptr [rsp + 104], r9
	lea	rbx, [rsp + 88]
	mov	qword ptr [rsp + 40], rbx
	mov	ecx, 1
	call	__acrt_iob_func
	mov	rdi, rax
	call	__local_stdio_printf_options
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp + 32], rbx
	mov	rdx, rdi
	mov	r8, rsi
	xor	r9d, r9d
	call	__stdio_common_vfprintf
	add	rsp, 48
	pop	rbx
	pop	rdi
	pop	rsi
	ret
                                        # -- End function
	.def	bruteforce15;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@00000000000000004530000043300000 # -- Begin function bruteforce15
	.section	.rdata,"dr",discard,__xmm@00000000000000004530000043300000
	.p2align	4
__xmm@00000000000000004530000043300000:
	.long	1127219200                      # 0x43300000
	.long	1160773632                      # 0x45300000
	.long	0                               # 0x0
	.long	0                               # 0x0
	.globl	__xmm@45300000000000004330000000000000
	.section	.rdata,"dr",discard,__xmm@45300000000000004330000000000000
	.p2align	4
__xmm@45300000000000004330000000000000:
	.quad	0x4330000000000000              # double 4503599627370496
	.quad	0x4530000000000000              # double 1.9342813113834067E+25
	.globl	__real@42344c3b28000000
	.section	.rdata,"dr",discard,__real@42344c3b28000000
	.p2align	3
__real@42344c3b28000000:
	.quad	0x42344c3b28000000              # double 87178291200
	.globl	__real@4059000000000000
	.section	.rdata,"dr",discard,__real@4059000000000000
	.p2align	3
__real@4059000000000000:
	.quad	0x4059000000000000              # double 100
	.text
	.globl	bruteforce15
	.p2align	4, 0x90
bruteforce15:                           # @bruteforce15
# %bb.0:
	push	r15
	push	r14
	push	r13
	push	r12
	push	rsi
	push	rdi
	push	rbp
	push	rbx
	sub	rsp, 488
	vmovdqa	xmmword ptr [rsp + 464], xmm15  # 16-byte Spill
	vmovdqa	xmmword ptr [rsp + 448], xmm14  # 16-byte Spill
	vmovdqa	xmmword ptr [rsp + 432], xmm13  # 16-byte Spill
	vmovdqa	xmmword ptr [rsp + 416], xmm12  # 16-byte Spill
	vmovdqa	xmmword ptr [rsp + 400], xmm11  # 16-byte Spill
	vmovdqa	xmmword ptr [rsp + 384], xmm10  # 16-byte Spill
	vmovaps	xmmword ptr [rsp + 368], xmm9   # 16-byte Spill
	vmovaps	xmmword ptr [rsp + 352], xmm8   # 16-byte Spill
	vmovaps	xmmword ptr [rsp + 336], xmm7   # 16-byte Spill
	vmovaps	xmmword ptr [rsp + 320], xmm6   # 16-byte Spill
	mov	esi, edx
	mov	ebx, ecx
	xor	r15d, r15d
	xor	ecx, ecx
	call	_time64
	mov	qword ptr [rsp + 168], rax      # 8-byte Spill
	mov	byte ptr [rsp + 61], bl
	mov	byte ptr [rsp + 39], bl         # 1-byte Spill
	movzx	eax, bl
	mov	qword ptr [rsp + 160], rax      # 8-byte Spill
	mov	eax, esi
	mov	qword ptr [rsp + 176], rax      # 8-byte Spill
	movsxd	rax, esi
	lea	r14, [rsp + rax]
	add	r14, 61
	mov	ecx, 15
	sub	ecx, eax
	mov	qword ptr [rsp + 184], rcx      # 8-byte Spill
	vmovdqa	xmm8, xmmword ptr [rip + __xmm@00000000000000004530000043300000] # xmm8 = [1127219200,1160773632,0,0]
	vmovapd	xmm9, xmmword ptr [rip + __xmm@45300000000000004330000000000000] # xmm9 = [4.503599627370496E+15,1.9342813113834067E+25]
	vmovsd	xmm6, qword ptr [rip + __real@42344c3b28000000] # xmm6 = mem[0],zero
	vmovsd	xmm7, qword ptr [rip + __real@4059000000000000] # xmm7 = mem[0],zero
	xor	edi, edi
	mov	dword ptr [rsp + 108], esi      # 4-byte Spill
	xor	esi, esi
	jmp	.LBB2_2
	.p2align	4, 0x90
.LBB2_1:                                #   in Loop: Header=BB2_2 Depth=1
	inc	sil
	cmp	sil, 15
	je	.LBB2_150
.LBB2_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_6 Depth 2
                                        #       Child Loop BB2_11 Depth 3
                                        #         Child Loop BB2_17 Depth 4
                                        #           Child Loop BB2_24 Depth 5
                                        #             Child Loop BB2_32 Depth 6
                                        #               Child Loop BB2_41 Depth 7
                                        #                 Child Loop BB2_51 Depth 8
                                        #                   Child Loop BB2_55 Depth 9
                                        #                     Child Loop BB2_60 Depth 10
                                        #                       Child Loop BB2_66 Depth 11
                                        #                         Child Loop BB2_73 Depth 12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	cmp	sil, byte ptr [rsp + 39]        # 1-byte Folded Reload
	je	.LBB2_1
# %bb.3:                                #   in Loop: Header=BB2_2 Depth=1
	mov	byte ptr [rsp + 62], sil
	xor	ebp, ebp
	mov	edx, r15d
	mov	qword ptr [rsp + 152], rsi      # 8-byte Spill
	jmp	.LBB2_6
	.p2align	4, 0x90
.LBB2_4:                                #   in Loop: Header=BB2_6 Depth=2
	mov	r15d, edx
.LBB2_5:                                #   in Loop: Header=BB2_6 Depth=2
	inc	bpl
	mov	edx, r15d
	cmp	bpl, 15
	je	.LBB2_1
.LBB2_6:                                #   Parent Loop BB2_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_11 Depth 3
                                        #         Child Loop BB2_17 Depth 4
                                        #           Child Loop BB2_24 Depth 5
                                        #             Child Loop BB2_32 Depth 6
                                        #               Child Loop BB2_41 Depth 7
                                        #                 Child Loop BB2_51 Depth 8
                                        #                   Child Loop BB2_55 Depth 9
                                        #                     Child Loop BB2_60 Depth 10
                                        #                       Child Loop BB2_66 Depth 11
                                        #                         Child Loop BB2_73 Depth 12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	cmp	bpl, sil
	je	.LBB2_4
# %bb.7:                                #   in Loop: Header=BB2_6 Depth=2
	cmp	bpl, byte ptr [rsp + 39]        # 1-byte Folded Reload
	je	.LBB2_4
# %bb.8:                                #   in Loop: Header=BB2_6 Depth=2
	mov	byte ptr [rsp + 63], bpl
	xor	ebx, ebx
	mov	dword ptr [rsp + 104], ebp      # 4-byte Spill
	jmp	.LBB2_11
	.p2align	4, 0x90
.LBB2_9:                                #   in Loop: Header=BB2_11 Depth=3
	mov	r15d, edx
.LBB2_10:                               #   in Loop: Header=BB2_11 Depth=3
	inc	bl
	mov	edx, r15d
	cmp	bl, 15
	je	.LBB2_5
.LBB2_11:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_17 Depth 4
                                        #           Child Loop BB2_24 Depth 5
                                        #             Child Loop BB2_32 Depth 6
                                        #               Child Loop BB2_41 Depth 7
                                        #                 Child Loop BB2_51 Depth 8
                                        #                   Child Loop BB2_55 Depth 9
                                        #                     Child Loop BB2_60 Depth 10
                                        #                       Child Loop BB2_66 Depth 11
                                        #                         Child Loop BB2_73 Depth 12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	cmp	bl, byte ptr [rsp + 39]         # 1-byte Folded Reload
	je	.LBB2_9
# %bb.12:                               #   in Loop: Header=BB2_11 Depth=3
	cmp	bl, bpl
	je	.LBB2_9
# %bb.13:                               #   in Loop: Header=BB2_11 Depth=3
	cmp	bl, sil
	je	.LBB2_9
# %bb.14:                               #   in Loop: Header=BB2_11 Depth=3
	mov	byte ptr [rsp + 64], bl
	xor	r13d, r13d
	mov	dword ptr [rsp + 100], ebx      # 4-byte Spill
	jmp	.LBB2_17
	.p2align	4, 0x90
.LBB2_15:                               #   in Loop: Header=BB2_17 Depth=4
	mov	r15d, edx
.LBB2_16:                               #   in Loop: Header=BB2_17 Depth=4
	inc	r13b
	mov	edx, r15d
	cmp	r13b, 15
	je	.LBB2_10
.LBB2_17:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB2_24 Depth 5
                                        #             Child Loop BB2_32 Depth 6
                                        #               Child Loop BB2_41 Depth 7
                                        #                 Child Loop BB2_51 Depth 8
                                        #                   Child Loop BB2_55 Depth 9
                                        #                     Child Loop BB2_60 Depth 10
                                        #                       Child Loop BB2_66 Depth 11
                                        #                         Child Loop BB2_73 Depth 12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	cmp	r13b, bl
	je	.LBB2_15
# %bb.18:                               #   in Loop: Header=BB2_17 Depth=4
	cmp	r13b, bpl
	je	.LBB2_15
# %bb.19:                               #   in Loop: Header=BB2_17 Depth=4
	cmp	r13b, sil
	je	.LBB2_15
# %bb.20:                               #   in Loop: Header=BB2_17 Depth=4
	cmp	r13b, byte ptr [rsp + 39]       # 1-byte Folded Reload
	je	.LBB2_15
# %bb.21:                               #   in Loop: Header=BB2_17 Depth=4
	mov	byte ptr [rsp + 65], r13b
	xor	ecx, ecx
	mov	dword ptr [rsp + 96], r13d      # 4-byte Spill
	jmp	.LBB2_24
	.p2align	4, 0x90
.LBB2_22:                               #   in Loop: Header=BB2_24 Depth=5
	mov	r15d, edx
.LBB2_23:                               #   in Loop: Header=BB2_24 Depth=5
	inc	cl
	mov	edx, r15d
	cmp	cl, 15
	je	.LBB2_16
.LBB2_24:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        # =>        This Loop Header: Depth=5
                                        #             Child Loop BB2_32 Depth 6
                                        #               Child Loop BB2_41 Depth 7
                                        #                 Child Loop BB2_51 Depth 8
                                        #                   Child Loop BB2_55 Depth 9
                                        #                     Child Loop BB2_60 Depth 10
                                        #                       Child Loop BB2_66 Depth 11
                                        #                         Child Loop BB2_73 Depth 12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	cmp	cl, r13b
	je	.LBB2_22
# %bb.25:                               #   in Loop: Header=BB2_24 Depth=5
	cmp	cl, bl
	je	.LBB2_22
# %bb.26:                               #   in Loop: Header=BB2_24 Depth=5
	cmp	cl, bpl
	je	.LBB2_22
# %bb.27:                               #   in Loop: Header=BB2_24 Depth=5
	cmp	cl, sil
	je	.LBB2_22
# %bb.28:                               #   in Loop: Header=BB2_24 Depth=5
	cmp	cl, byte ptr [rsp + 39]         # 1-byte Folded Reload
	je	.LBB2_22
# %bb.29:                               #   in Loop: Header=BB2_24 Depth=5
	mov	byte ptr [rsp + 66], cl
	xor	r9d, r9d
	mov	dword ptr [rsp + 92], ecx       # 4-byte Spill
	jmp	.LBB2_32
	.p2align	4, 0x90
.LBB2_30:                               #   in Loop: Header=BB2_32 Depth=6
	mov	r15d, edx
.LBB2_31:                               #   in Loop: Header=BB2_32 Depth=6
	inc	r9b
	mov	edx, r15d
	cmp	r9b, 15
	je	.LBB2_23
.LBB2_32:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        #           Parent Loop BB2_24 Depth=5
                                        # =>          This Loop Header: Depth=6
                                        #               Child Loop BB2_41 Depth 7
                                        #                 Child Loop BB2_51 Depth 8
                                        #                   Child Loop BB2_55 Depth 9
                                        #                     Child Loop BB2_60 Depth 10
                                        #                       Child Loop BB2_66 Depth 11
                                        #                         Child Loop BB2_73 Depth 12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	cmp	r9b, cl
	je	.LBB2_30
# %bb.33:                               #   in Loop: Header=BB2_32 Depth=6
	cmp	r9b, r13b
	je	.LBB2_30
# %bb.34:                               #   in Loop: Header=BB2_32 Depth=6
	cmp	r9b, bl
	je	.LBB2_30
# %bb.35:                               #   in Loop: Header=BB2_32 Depth=6
	cmp	r9b, bpl
	je	.LBB2_30
# %bb.36:                               #   in Loop: Header=BB2_32 Depth=6
	cmp	r9b, sil
	je	.LBB2_30
# %bb.37:                               #   in Loop: Header=BB2_32 Depth=6
	cmp	r9b, byte ptr [rsp + 39]        # 1-byte Folded Reload
	je	.LBB2_30
# %bb.38:                               #   in Loop: Header=BB2_32 Depth=6
	mov	byte ptr [rsp + 67], r9b
	movzx	r8d, r9b
	mov	dword ptr [rsp + 40], r8d       # 4-byte Spill
	vmovd	xmm0, r8d
	vmovdqa	xmmword ptr [rsp + 192], xmm0   # 16-byte Spill
	xor	eax, eax
	mov	dword ptr [rsp + 112], r9d      # 4-byte Spill
	jmp	.LBB2_41
	.p2align	4, 0x90
.LBB2_39:                               #   in Loop: Header=BB2_41 Depth=7
	mov	r15d, edx
.LBB2_40:                               #   in Loop: Header=BB2_41 Depth=7
	mov	eax, dword ptr [rsp + 116]      # 4-byte Reload
	inc	al
	mov	edx, r15d
	cmp	al, 15
	mov	r9d, dword ptr [rsp + 112]      # 4-byte Reload
	je	.LBB2_31
.LBB2_41:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        #           Parent Loop BB2_24 Depth=5
                                        #             Parent Loop BB2_32 Depth=6
                                        # =>            This Loop Header: Depth=7
                                        #                 Child Loop BB2_51 Depth 8
                                        #                   Child Loop BB2_55 Depth 9
                                        #                     Child Loop BB2_60 Depth 10
                                        #                       Child Loop BB2_66 Depth 11
                                        #                         Child Loop BB2_73 Depth 12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	cmp	al, r9b
	mov	dword ptr [rsp + 116], eax      # 4-byte Spill
	je	.LBB2_39
# %bb.42:                               #   in Loop: Header=BB2_41 Depth=7
	cmp	al, cl
	je	.LBB2_39
# %bb.43:                               #   in Loop: Header=BB2_41 Depth=7
	cmp	al, r13b
	je	.LBB2_39
# %bb.44:                               #   in Loop: Header=BB2_41 Depth=7
	cmp	al, bl
	je	.LBB2_39
# %bb.45:                               #   in Loop: Header=BB2_41 Depth=7
	cmp	al, bpl
	je	.LBB2_39
# %bb.46:                               #   in Loop: Header=BB2_41 Depth=7
	cmp	al, sil
	je	.LBB2_39
# %bb.47:                               #   in Loop: Header=BB2_41 Depth=7
	cmp	al, byte ptr [rsp + 39]         # 1-byte Folded Reload
	je	.LBB2_39
# %bb.48:                               #   in Loop: Header=BB2_41 Depth=7
	mov	byte ptr [rsp + 68], al
	movzx	r8d, al
	vmovdqa	xmm0, xmmword ptr [rsp + 192]   # 16-byte Reload
	vpinsrb	xmm0, xmm0, r8d, 1
	movzx	eax, cl
	mov	dword ptr [rsp + 44], eax       # 4-byte Spill
	vpinsrb	xmm0, xmm0, eax, 2
	movzx	eax, r13b
	mov	dword ptr [rsp + 52], eax       # 4-byte Spill
	vpinsrb	xmm0, xmm0, eax, 3
	movzx	eax, bl
	mov	dword ptr [rsp + 76], eax       # 4-byte Spill
	vpinsrb	xmm0, xmm0, eax, 4
	movzx	eax, bpl
	mov	dword ptr [rsp + 84], eax       # 4-byte Spill
	vpinsrb	xmm0, xmm0, eax, 5
	movzx	eax, sil
	mov	dword ptr [rsp + 120], eax      # 4-byte Spill
	vpinsrb	xmm0, xmm0, eax, 6
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 160], 7 # 4-byte Folded Reload
	vmovdqa	xmmword ptr [rsp + 224], xmm0   # 16-byte Spill
	mov	dword ptr [rsp + 48], r8d       # 4-byte Spill
	vmovd	xmm0, r8d
	vmovdqa	xmmword ptr [rsp + 208], xmm0   # 16-byte Spill
	xor	eax, eax
	jmp	.LBB2_51
	.p2align	4, 0x90
.LBB2_49:                               #   in Loop: Header=BB2_51 Depth=8
	mov	r15d, edx
.LBB2_50:                               #   in Loop: Header=BB2_51 Depth=8
	mov	eax, dword ptr [rsp + 124]      # 4-byte Reload
	inc	al
	mov	edx, r15d
	cmp	al, 15
	je	.LBB2_40
.LBB2_51:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        #           Parent Loop BB2_24 Depth=5
                                        #             Parent Loop BB2_32 Depth=6
                                        #               Parent Loop BB2_41 Depth=7
                                        # =>              This Loop Header: Depth=8
                                        #                   Child Loop BB2_55 Depth 9
                                        #                     Child Loop BB2_60 Depth 10
                                        #                       Child Loop BB2_66 Depth 11
                                        #                         Child Loop BB2_73 Depth 12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	vmovd	xmm0, eax
	vpbroadcastb	xmm0, xmm0
	vpcmpeqb	xmm0, xmm0, xmmword ptr [rsp + 224] # 16-byte Folded Reload
	vpmovsxbw	xmm0, xmm0
	vpsllw	xmm0, xmm0, 15
	mov	r8d, eax
	vpmovmskb	eax, xmm0
	test	eax, 43690
	mov	dword ptr [rsp + 124], r8d      # 4-byte Spill
	jne	.LBB2_49
# %bb.52:                               #   in Loop: Header=BB2_51 Depth=8
	mov	byte ptr [rsp + 69], r8b
	movzx	eax, r8b
	vmovdqa	xmm0, xmmword ptr [rsp + 208]   # 16-byte Reload
	vpinsrb	xmm0, xmm0, eax, 1
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 40], 2 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 44], 3 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 52], 4 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 76], 5 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 84], 6 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 120], 7 # 4-byte Folded Reload
	vmovdqa	xmmword ptr [rsp + 256], xmm0   # 16-byte Spill
	mov	dword ptr [rsp + 56], eax       # 4-byte Spill
	vmovd	xmm0, eax
	vmovdqa	xmmword ptr [rsp + 240], xmm0   # 16-byte Spill
	xor	eax, eax
	jmp	.LBB2_55
	.p2align	4, 0x90
.LBB2_53:                               #   in Loop: Header=BB2_55 Depth=9
	mov	r15d, edx
.LBB2_54:                               #   in Loop: Header=BB2_55 Depth=9
	mov	eax, dword ptr [rsp + 128]      # 4-byte Reload
	inc	al
	mov	edx, r15d
	cmp	al, 15
	je	.LBB2_50
.LBB2_55:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        #           Parent Loop BB2_24 Depth=5
                                        #             Parent Loop BB2_32 Depth=6
                                        #               Parent Loop BB2_41 Depth=7
                                        #                 Parent Loop BB2_51 Depth=8
                                        # =>                This Loop Header: Depth=9
                                        #                     Child Loop BB2_60 Depth 10
                                        #                       Child Loop BB2_66 Depth 11
                                        #                         Child Loop BB2_73 Depth 12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	vmovd	xmm0, eax
	vpbroadcastb	xmm0, xmm0
	vpcmpeqb	xmm0, xmm0, xmmword ptr [rsp + 256] # 16-byte Folded Reload
	vpmovsxbw	xmm0, xmm0
	vpsllw	xmm0, xmm0, 15
	mov	r8d, eax
	vpmovmskb	eax, xmm0
	test	eax, 43690
	mov	dword ptr [rsp + 128], r8d      # 4-byte Spill
	jne	.LBB2_53
# %bb.56:                               #   in Loop: Header=BB2_55 Depth=9
	cmp	r8b, byte ptr [rsp + 39]        # 1-byte Folded Reload
	je	.LBB2_53
# %bb.57:                               #   in Loop: Header=BB2_55 Depth=9
	mov	byte ptr [rsp + 70], r8b
	movzx	eax, r8b
	vmovdqa	xmm0, xmmword ptr [rsp + 240]   # 16-byte Reload
	vpinsrb	xmm0, xmm0, eax, 1
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 48], 2 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 40], 3 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 44], 4 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 52], 5 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 76], 6 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 84], 7 # 4-byte Folded Reload
	vmovdqa	xmmword ptr [rsp + 288], xmm0   # 16-byte Spill
	mov	dword ptr [rsp + 80], eax       # 4-byte Spill
	vmovd	xmm0, eax
	vmovdqa	xmmword ptr [rsp + 272], xmm0   # 16-byte Spill
	xor	eax, eax
	jmp	.LBB2_60
	.p2align	4, 0x90
.LBB2_58:                               #   in Loop: Header=BB2_60 Depth=10
	mov	r15d, edx
.LBB2_59:                               #   in Loop: Header=BB2_60 Depth=10
	mov	eax, dword ptr [rsp + 132]      # 4-byte Reload
	inc	al
	mov	edx, r15d
	cmp	al, 15
	je	.LBB2_54
.LBB2_60:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        #           Parent Loop BB2_24 Depth=5
                                        #             Parent Loop BB2_32 Depth=6
                                        #               Parent Loop BB2_41 Depth=7
                                        #                 Parent Loop BB2_51 Depth=8
                                        #                   Parent Loop BB2_55 Depth=9
                                        # =>                  This Loop Header: Depth=10
                                        #                       Child Loop BB2_66 Depth 11
                                        #                         Child Loop BB2_73 Depth 12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	vmovd	xmm0, eax
	vpbroadcastb	xmm0, xmm0
	vpcmpeqb	xmm0, xmm0, xmmword ptr [rsp + 288] # 16-byte Folded Reload
	vpmovsxbw	xmm0, xmm0
	vpsllw	xmm0, xmm0, 15
	mov	r8d, eax
	vpmovmskb	eax, xmm0
	test	eax, 43690
	mov	dword ptr [rsp + 132], r8d      # 4-byte Spill
	jne	.LBB2_58
# %bb.61:                               #   in Loop: Header=BB2_60 Depth=10
	cmp	r8b, sil
	je	.LBB2_58
# %bb.62:                               #   in Loop: Header=BB2_60 Depth=10
	mov	eax, r8d
	cmp	al, byte ptr [rsp + 39]         # 1-byte Folded Reload
	je	.LBB2_58
# %bb.63:                               #   in Loop: Header=BB2_60 Depth=10
	mov	byte ptr [rsp + 71], al
	movzx	eax, al
	vmovdqa	xmm0, xmmword ptr [rsp + 272]   # 16-byte Reload
	vpinsrb	xmm0, xmm0, eax, 1
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 56], 2 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 48], 3 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 40], 4 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 44], 5 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 52], 6 # 4-byte Folded Reload
	vpinsrb	xmm12, xmm0, byte ptr [rsp + 76], 7 # 4-byte Folded Reload
	mov	dword ptr [rsp + 88], eax       # 4-byte Spill
	vmovd	xmm0, eax
	vmovdqa	xmmword ptr [rsp + 304], xmm0   # 16-byte Spill
	xor	eax, eax
	jmp	.LBB2_66
	.p2align	4, 0x90
.LBB2_64:                               #   in Loop: Header=BB2_66 Depth=11
	mov	r15d, edx
.LBB2_65:                               #   in Loop: Header=BB2_66 Depth=11
	mov	eax, dword ptr [rsp + 136]      # 4-byte Reload
	inc	al
	mov	edx, r15d
	cmp	al, 15
	je	.LBB2_59
.LBB2_66:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        #           Parent Loop BB2_24 Depth=5
                                        #             Parent Loop BB2_32 Depth=6
                                        #               Parent Loop BB2_41 Depth=7
                                        #                 Parent Loop BB2_51 Depth=8
                                        #                   Parent Loop BB2_55 Depth=9
                                        #                     Parent Loop BB2_60 Depth=10
                                        # =>                    This Loop Header: Depth=11
                                        #                         Child Loop BB2_73 Depth 12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	vmovd	xmm0, eax
	vpbroadcastb	xmm0, xmm0
	vpcmpeqb	xmm0, xmm12, xmm0
	vpmovsxbw	xmm0, xmm0
	vpsllw	xmm0, xmm0, 15
	mov	r8d, eax
	vpmovmskb	eax, xmm0
	test	eax, 43690
	mov	dword ptr [rsp + 136], r8d      # 4-byte Spill
	jne	.LBB2_64
# %bb.67:                               #   in Loop: Header=BB2_66 Depth=11
	cmp	r8b, bpl
	je	.LBB2_64
# %bb.68:                               #   in Loop: Header=BB2_66 Depth=11
	mov	eax, r8d
	cmp	al, sil
	je	.LBB2_64
# %bb.69:                               #   in Loop: Header=BB2_66 Depth=11
	cmp	al, byte ptr [rsp + 39]         # 1-byte Folded Reload
	je	.LBB2_64
# %bb.70:                               #   in Loop: Header=BB2_66 Depth=11
	mov	byte ptr [rsp + 72], al
	movzx	eax, al
	vmovdqa	xmm0, xmmword ptr [rsp + 304]   # 16-byte Reload
	vpinsrb	xmm0, xmm0, eax, 1
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 80], 2 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 56], 3 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 48], 4 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 40], 5 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 44], 6 # 4-byte Folded Reload
	vpinsrb	xmm14, xmm0, byte ptr [rsp + 52], 7 # 4-byte Folded Reload
	mov	dword ptr [rsp + 144], eax      # 4-byte Spill
	vmovd	xmm13, eax
	xor	r8d, r8d
	jmp	.LBB2_73
	.p2align	4, 0x90
.LBB2_71:                               #   in Loop: Header=BB2_73 Depth=12
	mov	r9d, ebx
	mov	rbx, rsi
	mov	r15d, edx
.LBB2_72:                               #   in Loop: Header=BB2_73 Depth=12
	mov	r8d, dword ptr [rsp + 140]      # 4-byte Reload
	inc	r8b
	mov	edx, r15d
	cmp	r8b, 15
	mov	rsi, rbx
	mov	ebx, r9d
	je	.LBB2_65
.LBB2_73:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        #           Parent Loop BB2_24 Depth=5
                                        #             Parent Loop BB2_32 Depth=6
                                        #               Parent Loop BB2_41 Depth=7
                                        #                 Parent Loop BB2_51 Depth=8
                                        #                   Parent Loop BB2_55 Depth=9
                                        #                     Parent Loop BB2_60 Depth=10
                                        #                       Parent Loop BB2_66 Depth=11
                                        # =>                      This Loop Header: Depth=12
                                        #                           Child Loop BB2_81 Depth 13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	vmovd	xmm0, r8d
	vpbroadcastb	xmm0, xmm0
	vpcmpeqb	xmm0, xmm14, xmm0
	vpmovsxbw	xmm0, xmm0
	vpsllw	xmm0, xmm0, 15
	vpmovmskb	eax, xmm0
	test	eax, 43690
	mov	dword ptr [rsp + 140], r8d      # 4-byte Spill
	jne	.LBB2_71
# %bb.74:                               #   in Loop: Header=BB2_73 Depth=12
	cmp	r8b, bl
	je	.LBB2_71
# %bb.75:                               #   in Loop: Header=BB2_73 Depth=12
	cmp	r8b, bpl
	je	.LBB2_71
# %bb.76:                               #   in Loop: Header=BB2_73 Depth=12
	cmp	r8b, sil
	je	.LBB2_71
# %bb.77:                               #   in Loop: Header=BB2_73 Depth=12
	cmp	r8b, byte ptr [rsp + 39]        # 1-byte Folded Reload
	je	.LBB2_71
# %bb.78:                               #   in Loop: Header=BB2_73 Depth=12
	mov	r9d, ebx
	mov	rbx, rsi
	mov	byte ptr [rsp + 73], r8b
	movzx	eax, r8b
	vpinsrb	xmm0, xmm13, eax, 1
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 88], 2 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 80], 3 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 56], 4 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 48], 5 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 40], 6 # 4-byte Folded Reload
	vpinsrb	xmm10, xmm0, byte ptr [rsp + 44], 7 # 4-byte Folded Reload
	vmovd	xmm15, eax
	xor	esi, esi
	jmp	.LBB2_81
	.p2align	4, 0x90
.LBB2_79:                               #   in Loop: Header=BB2_81 Depth=13
	mov	r15d, edx
	mov	rsi, rbx
	mov	ebx, r9d
.LBB2_80:                               #   in Loop: Header=BB2_81 Depth=13
	mov	r9d, ebx
	mov	rbx, rsi
	mov	esi, dword ptr [rsp + 148]      # 4-byte Reload
	inc	sil
	mov	edx, r15d
	cmp	sil, 15
	je	.LBB2_72
.LBB2_81:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        #           Parent Loop BB2_24 Depth=5
                                        #             Parent Loop BB2_32 Depth=6
                                        #               Parent Loop BB2_41 Depth=7
                                        #                 Parent Loop BB2_51 Depth=8
                                        #                   Parent Loop BB2_55 Depth=9
                                        #                     Parent Loop BB2_60 Depth=10
                                        #                       Parent Loop BB2_66 Depth=11
                                        #                         Parent Loop BB2_73 Depth=12
                                        # =>                        This Loop Header: Depth=13
                                        #                             Child Loop BB2_90 Depth 14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	vmovd	xmm0, esi
	vpbroadcastb	xmm0, xmm0
	vpcmpeqb	xmm0, xmm10, xmm0
	vpmovsxbw	xmm0, xmm0
	vpsllw	xmm0, xmm0, 15
	vpmovmskb	eax, xmm0
	test	eax, 43690
	mov	dword ptr [rsp + 148], esi      # 4-byte Spill
	jne	.LBB2_79
# %bb.82:                               #   in Loop: Header=BB2_81 Depth=13
	cmp	sil, r13b
	je	.LBB2_79
# %bb.83:                               #   in Loop: Header=BB2_81 Depth=13
	cmp	sil, r9b
	je	.LBB2_79
# %bb.84:                               #   in Loop: Header=BB2_81 Depth=13
	cmp	sil, bpl
	je	.LBB2_79
# %bb.85:                               #   in Loop: Header=BB2_81 Depth=13
	cmp	sil, bl
	je	.LBB2_79
# %bb.86:                               #   in Loop: Header=BB2_81 Depth=13
	cmp	sil, byte ptr [rsp + 39]        # 1-byte Folded Reload
	je	.LBB2_79
# %bb.87:                               #   in Loop: Header=BB2_81 Depth=13
	movzx	eax, sil
	vpinsrb	xmm0, xmm15, eax, 1
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 144], 2 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 88], 3 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 80], 4 # 4-byte Folded Reload
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 56], 5 # 4-byte Folded Reload
	mov	byte ptr [rsp + 74], sil
	vpinsrb	xmm0, xmm0, byte ptr [rsp + 48], 6 # 4-byte Folded Reload
	vpinsrb	xmm11, xmm0, byte ptr [rsp + 40], 7 # 4-byte Folded Reload
	xor	r12d, r12d
	mov	rsi, rbx
	mov	ebx, r9d
	jmp	.LBB2_90
	.p2align	4, 0x90
.LBB2_121:                              #   in Loop: Header=BB2_90 Depth=14
	mov	r15d, edx
.LBB2_89:                               #   in Loop: Header=BB2_90 Depth=14
	inc	r12b
	mov	edx, r15d
	cmp	r12b, 15
	je	.LBB2_80
.LBB2_90:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        #           Parent Loop BB2_24 Depth=5
                                        #             Parent Loop BB2_32 Depth=6
                                        #               Parent Loop BB2_41 Depth=7
                                        #                 Parent Loop BB2_51 Depth=8
                                        #                   Parent Loop BB2_55 Depth=9
                                        #                     Parent Loop BB2_60 Depth=10
                                        #                       Parent Loop BB2_66 Depth=11
                                        #                         Parent Loop BB2_73 Depth=12
                                        #                           Parent Loop BB2_81 Depth=13
                                        # =>                          This Loop Header: Depth=14
                                        #                               Child Loop BB2_99 Depth 15
                                        #                               Child Loop BB2_106 Depth 15
	vmovd	xmm0, r12d
	vpbroadcastb	xmm0, xmm0
	vpcmpeqb	xmm0, xmm11, xmm0
	vpmovsxbw	xmm0, xmm0
	vpsllw	xmm0, xmm0, 15
	vpmovmskb	eax, xmm0
	test	eax, 43690
	jne	.LBB2_121
# %bb.91:                               #   in Loop: Header=BB2_90 Depth=14
	cmp	r12b, cl
	je	.LBB2_121
# %bb.92:                               #   in Loop: Header=BB2_90 Depth=14
	cmp	r12b, r13b
	je	.LBB2_121
# %bb.93:                               #   in Loop: Header=BB2_90 Depth=14
	cmp	r12b, bl
	je	.LBB2_121
# %bb.94:                               #   in Loop: Header=BB2_90 Depth=14
	cmp	r12b, bpl
	je	.LBB2_121
# %bb.95:                               #   in Loop: Header=BB2_90 Depth=14
	cmp	r12b, sil
	je	.LBB2_121
# %bb.96:                               #   in Loop: Header=BB2_90 Depth=14
	cmp	r12b, byte ptr [rsp + 39]       # 1-byte Folded Reload
	je	.LBB2_121
# %bb.97:                               #   in Loop: Header=BB2_90 Depth=14
	mov	rcx, qword ptr [rsp + 160]      # 8-byte Reload
	lea	rax, [rip + initial_costs]
	movzx	r9d, byte ptr [rcx + rax]
	inc	r9d
	xor	eax, eax
	mov	byte ptr [rsp + 75], r12b
	lea	rbp, [rip + values]
	movzx	r11d, byte ptr [rcx + rbp]
	cmp	dword ptr [rsp + 108], 2        # 4-byte Folded Reload
	jl	.LBB2_101
# %bb.98:                               #   in Loop: Header=BB2_90 Depth=14
	mov	r13, rdi
	xor	r10d, r10d
	mov	ebx, 1
	movzx	r8d, byte ptr [rsp + 39]        # 1-byte Folded Reload
	mov	r15, qword ptr [rsp + 176]      # 8-byte Reload
	.p2align	4, 0x90
.LBB2_99:                               #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        #           Parent Loop BB2_24 Depth=5
                                        #             Parent Loop BB2_32 Depth=6
                                        #               Parent Loop BB2_41 Depth=7
                                        #                 Parent Loop BB2_51 Depth=8
                                        #                   Parent Loop BB2_55 Depth=9
                                        #                     Parent Loop BB2_60 Depth=10
                                        #                       Parent Loop BB2_66 Depth=11
                                        #                         Parent Loop BB2_73 Depth=12
                                        #                           Parent Loop BB2_81 Depth=13
                                        #                             Parent Loop BB2_90 Depth=14
                                        # =>                            This Inner Loop Header: Depth=15
	movzx	ecx, r8b
	movzx	r8d, byte ptr [rsp + rbx + 61]
	movzx	ebp, r8b
	lea	rcx, [rcx + 4*rcx]
	lea	rcx, [rcx + 2*rcx]
	lea	rdi, [rip + costs]
	add	rcx, rdi
	movzx	ecx, byte ptr [rbp + rcx]
	lea	edi, [rcx + r9]
	inc	edi
	cmp	edi, 26
	ja	.LBB2_102
# %bb.100:                              #   in Loop: Header=BB2_99 Depth=15
	inc	ecx
	imul	ecx, r11d
	add	ecx, r10d
	lea	rsi, [rip + values]
	movzx	ebp, byte ptr [rbp + rsi]
	add	r11d, ebp
	inc	rbx
	mov	r9d, edi
	mov	r10d, ecx
	cmp	r15, rbx
	jne	.LBB2_99
	jmp	.LBB2_104
	.p2align	4, 0x90
.LBB2_101:                              #   in Loop: Header=BB2_90 Depth=14
	mov	r13, rdi
	xor	ecx, ecx
	jmp	.LBB2_103
.LBB2_102:                              #   in Loop: Header=BB2_90 Depth=14
	mov	ecx, r10d
.LBB2_103:                              #   in Loop: Header=BB2_90 Depth=14
	mov	edi, r9d
.LBB2_104:                              #   in Loop: Header=BB2_90 Depth=14
	mov	r15d, 26
	sub	r15d, edi
	imul	r15d, r11d
	movzx	r10d, byte ptr [r14]
	lea	rbp, [rip + initial_costs]
	movzx	r8d, byte ptr [r10 + rbp]
	inc	r8d
	lea	rbp, [rip + values]
	movzx	r11d, byte ptr [r10 + rbp]
	cmp	dword ptr [rsp + 108], 13       # 4-byte Folded Reload
	jg	.LBB2_110
# %bb.105:                              #   in Loop: Header=BB2_90 Depth=14
	xor	r9d, r9d
	mov	ebp, 1
	.p2align	4, 0x90
.LBB2_106:                              #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        #       Parent Loop BB2_11 Depth=3
                                        #         Parent Loop BB2_17 Depth=4
                                        #           Parent Loop BB2_24 Depth=5
                                        #             Parent Loop BB2_32 Depth=6
                                        #               Parent Loop BB2_41 Depth=7
                                        #                 Parent Loop BB2_51 Depth=8
                                        #                   Parent Loop BB2_55 Depth=9
                                        #                     Parent Loop BB2_60 Depth=10
                                        #                       Parent Loop BB2_66 Depth=11
                                        #                         Parent Loop BB2_73 Depth=12
                                        #                           Parent Loop BB2_81 Depth=13
                                        #                             Parent Loop BB2_90 Depth=14
                                        # =>                            This Inner Loop Header: Depth=15
	mov	eax, r10d
	movzx	eax, r10b
	movzx	r10d, byte ptr [r14 + rbp]
	movzx	edi, r10b
	lea	rax, [rax + 4*rax]
	lea	rax, [rax + 2*rax]
	lea	rbx, [rip + costs]
	add	rax, rbx
	movzx	eax, byte ptr [rdi + rax]
	lea	ebx, [rax + r8]
	inc	ebx
	cmp	ebx, 26
	ja	.LBB2_109
# %bb.107:                              #   in Loop: Header=BB2_106 Depth=15
	inc	eax
	imul	eax, r11d
	add	eax, r9d
	lea	rsi, [rip + values]
	movzx	edi, byte ptr [rdi + rsi]
	add	r11d, edi
	inc	rbp
	mov	r8d, ebx
	mov	r9d, eax
	cmp	qword ptr [rsp + 184], rbp      # 8-byte Folded Reload
	jne	.LBB2_106
	jmp	.LBB2_111
.LBB2_109:                              #   in Loop: Header=BB2_90 Depth=14
	mov	eax, r9d
.LBB2_110:                              #   in Loop: Header=BB2_90 Depth=14
	mov	ebx, r8d
.LBB2_111:                              #   in Loop: Header=BB2_90 Depth=14
	mov	ebp, 26
	sub	ebp, ebx
	imul	ebp, r11d
	add	r15d, ecx
	add	r15d, eax
	add	r15d, ebp
	cmp	r15d, edx
	jle	.LBB2_113
# %bb.112:                              #   in Loop: Header=BB2_90 Depth=14
	lea	rcx, [rip + "??_C@_0BD@LJLGLEKC@New?5max?3?5?$CFd?5?9?$DO?5?$CFd?6?$AA@"]
	mov	r8d, r15d
	call	printf
	jmp	.LBB2_114
	.p2align	4, 0x90
.LBB2_113:                              #   in Loop: Header=BB2_90 Depth=14
	mov	r15d, edx
.LBB2_114:                              #   in Loop: Header=BB2_90 Depth=14
	mov	rdi, r13
	mov	rsi, qword ptr [rsp + 152]      # 8-byte Reload
	mov	ebp, dword ptr [rsp + 104]      # 4-byte Reload
	mov	ebx, dword ptr [rsp + 100]      # 4-byte Reload
	mov	r13d, dword ptr [rsp + 96]      # 4-byte Reload
	inc	rdi
	mov	rax, rdi
	movabs	rcx, -4078282918271054303
	imul	rax, rcx
	rorx	rax, rax, 8
	movabs	rcx, 184467440737
	cmp	rax, rcx
	ja	.LBB2_88
# %bb.115:                              #   in Loop: Header=BB2_90 Depth=14
	lea	rcx, [rip + "??_C@_0BO@JIGJCIEC@Iterations?3?5?$CFllu?187178291200?6?$AA@"]
	mov	rdx, rdi
	call	printf
	vmovq	xmm0, rdi
	vpunpckldq	xmm0, xmm0, xmm8        # xmm0 = xmm0[0],xmm8[0],xmm0[1],xmm8[1]
	vsubpd	xmm0, xmm0, xmm9
	vpermilpd	xmm1, xmm0, 1           # xmm1 = xmm0[1,0]
	vaddsd	xmm0, xmm1, xmm0
	vdivsd	xmm0, xmm0, xmm6
	vmulsd	xmm1, xmm0, xmm7
	lea	rcx, [rip + "??_C@_0BH@BOHIALFD@Percent?5complete?3?5?$CFlf?6?$AA@"]
	vmovq	rdx, xmm1
	call	printf
	xor	ecx, ecx
	call	_time64
	sub	rax, qword ptr [rsp + 168]      # 8-byte Folded Reload
	lea	rcx, [rip + "??_C@_0BH@OLJINLLO@Seconds?5elapsed?3?5?$CFlld?6?$AA@"]
	mov	rdx, rax
	call	printf
.LBB2_88:                               #   in Loop: Header=BB2_90 Depth=14
	mov	ecx, dword ptr [rsp + 92]       # 4-byte Reload
	jmp	.LBB2_89
.LBB2_150:
	lea	rcx, [rip + "??_C@_0P@MMENOLBM@FINAL?5MAX?3?5?$CFd?6?$AA@"]
	mov	edx, r15d
	call	printf
	vmovaps	xmm6, xmmword ptr [rsp + 320]   # 16-byte Reload
	vmovaps	xmm7, xmmword ptr [rsp + 336]   # 16-byte Reload
	vmovaps	xmm8, xmmword ptr [rsp + 352]   # 16-byte Reload
	vmovaps	xmm9, xmmword ptr [rsp + 368]   # 16-byte Reload
	vmovaps	xmm10, xmmword ptr [rsp + 384]  # 16-byte Reload
	vmovaps	xmm11, xmmword ptr [rsp + 400]  # 16-byte Reload
	vmovaps	xmm12, xmmword ptr [rsp + 416]  # 16-byte Reload
	vmovaps	xmm13, xmmword ptr [rsp + 432]  # 16-byte Reload
	vmovaps	xmm14, xmmword ptr [rsp + 448]  # 16-byte Reload
	vmovaps	xmm15, xmmword ptr [rsp + 464]  # 16-byte Reload
	add	rsp, 488
	pop	rbx
	pop	rbp
	pop	rdi
	pop	rsi
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
                                        # -- End function
	.def	main;
	.scl	2;
	.type	32;
	.endef
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
main:                                   # @main
# %bb.0:
	push	rsi
	push	rdi
	sub	rsp, 40
	mov	rsi, rdx
	mov	rcx, qword ptr [rdx + 8]
	call	atoi
	mov	edi, eax
	mov	rcx, qword ptr [rsi + 16]
	call	atoi
	mov	esi, eax
	lea	rcx, [rip + "??_C@_0BE@FCPHBOHJ@Start?3?5?$CFd?$DL?5Cut?3?5?$CFd?6?$AA@"]
	mov	edx, edi
	mov	r8d, esi
	call	printf
	mov	ecx, edi
	mov	edx, esi
	call	bruteforce15
	xor	eax, eax
	add	rsp, 40
	pop	rdi
	pop	rsi
	ret
                                        # -- End function
	.def	__local_stdio_printf_options;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,__local_stdio_printf_options
	.globl	__local_stdio_printf_options    # -- Begin function __local_stdio_printf_options
	.p2align	4, 0x90
__local_stdio_printf_options:           # @__local_stdio_printf_options
# %bb.0:
	lea	rax, [rip + __local_stdio_printf_options._OptionsStorage]
	ret
                                        # -- End function
	.section	.rdata,"dr",discard,"??_C@_03PMGGPEJJ@?$CFd?6?$AA@"
	.globl	"??_C@_03PMGGPEJJ@?$CFd?6?$AA@" # @"??_C@_03PMGGPEJJ@?$CFd?6?$AA@"
"??_C@_03PMGGPEJJ@?$CFd?6?$AA@":
	.asciz	"%d\n"

	.section	.rdata,"dr"
	.p2align	4                               # @names
names:
	.quad	"??_C@_02DGLLNMBI@EZ?$AA@"
	.quad	"??_C@_02KPPNMLFJ@FC?$AA@"
	.quad	"??_C@_02LDGFHOIO@FU?$AA@"
	.quad	"??_C@_02NJNGHICB@IF?$AA@"
	.quad	"??_C@_02PHHIKPHE@IR?$AA@"
	.quad	"??_C@_02KDGELGKL@JT?$AA@"
	.quad	"??_C@_02PBHPPPIM@KE?$AA@"
	.quad	"??_C@_02BEEAOEKM@NN?$AA@"
	.quad	"??_C@_02BAABAKAN@OY?$AA@"
	.quad	"??_C@_02FEKCMNFA@PH?$AA@"
	.quad	"??_C@_02LCNFJAAN@PT?$AA@"
	.quad	"??_C@_02NCPILLKI@QG?$AA@"
	.quad	"??_C@_02ICKFEMNG@SV?$AA@"
	.quad	"??_C@_02BMOKPDEL@TO?$AA@"
	.quad	"??_C@_02IGCIDAGE@UV?$AA@"

	.section	.rdata,"dr",discard,"??_C@_03IKGEINEE@?$CFs?5?$AA@"
	.globl	"??_C@_03IKGEINEE@?$CFs?5?$AA@" # @"??_C@_03IKGEINEE@?$CFs?5?$AA@"
"??_C@_03IKGEINEE@?$CFs?5?$AA@":
	.asciz	"%s "

	.section	.rdata,"dr",discard,"??_C@_0BD@LJLGLEKC@New?5max?3?5?$CFd?5?9?$DO?5?$CFd?6?$AA@"
	.globl	"??_C@_0BD@LJLGLEKC@New?5max?3?5?$CFd?5?9?$DO?5?$CFd?6?$AA@" # @"??_C@_0BD@LJLGLEKC@New?5max?3?5?$CFd?5?9?$DO?5?$CFd?6?$AA@"
"??_C@_0BD@LJLGLEKC@New?5max?3?5?$CFd?5?9?$DO?5?$CFd?6?$AA@":
	.asciz	"New max: %d -> %d\n"

	.section	.rdata,"dr",discard,"??_C@_0BO@JIGJCIEC@Iterations?3?5?$CFllu?187178291200?6?$AA@"
	.globl	"??_C@_0BO@JIGJCIEC@Iterations?3?5?$CFllu?187178291200?6?$AA@" # @"??_C@_0BO@JIGJCIEC@Iterations?3?5?$CFllu?187178291200?6?$AA@"
"??_C@_0BO@JIGJCIEC@Iterations?3?5?$CFllu?187178291200?6?$AA@":
	.asciz	"Iterations: %llu/87178291200\n"

	.section	.rdata,"dr",discard,"??_C@_0BH@BOHIALFD@Percent?5complete?3?5?$CFlf?6?$AA@"
	.globl	"??_C@_0BH@BOHIALFD@Percent?5complete?3?5?$CFlf?6?$AA@" # @"??_C@_0BH@BOHIALFD@Percent?5complete?3?5?$CFlf?6?$AA@"
"??_C@_0BH@BOHIALFD@Percent?5complete?3?5?$CFlf?6?$AA@":
	.asciz	"Percent complete: %lf\n"

	.section	.rdata,"dr",discard,"??_C@_0BH@OLJINLLO@Seconds?5elapsed?3?5?$CFlld?6?$AA@"
	.globl	"??_C@_0BH@OLJINLLO@Seconds?5elapsed?3?5?$CFlld?6?$AA@" # @"??_C@_0BH@OLJINLLO@Seconds?5elapsed?3?5?$CFlld?6?$AA@"
"??_C@_0BH@OLJINLLO@Seconds?5elapsed?3?5?$CFlld?6?$AA@":
	.asciz	"Seconds elapsed: %lld\n"

	.section	.rdata,"dr",discard,"??_C@_0P@MMENOLBM@FINAL?5MAX?3?5?$CFd?6?$AA@"
	.globl	"??_C@_0P@MMENOLBM@FINAL?5MAX?3?5?$CFd?6?$AA@" # @"??_C@_0P@MMENOLBM@FINAL?5MAX?3?5?$CFd?6?$AA@"
"??_C@_0P@MMENOLBM@FINAL?5MAX?3?5?$CFd?6?$AA@":
	.asciz	"FINAL MAX: %d\n"

	.section	.rdata,"dr",discard,"??_C@_0BE@FCPHBOHJ@Start?3?5?$CFd?$DL?5Cut?3?5?$CFd?6?$AA@"
	.globl	"??_C@_0BE@FCPHBOHJ@Start?3?5?$CFd?$DL?5Cut?3?5?$CFd?6?$AA@" # @"??_C@_0BE@FCPHBOHJ@Start?3?5?$CFd?$DL?5Cut?3?5?$CFd?6?$AA@"
"??_C@_0BE@FCPHBOHJ@Start?3?5?$CFd?$DL?5Cut?3?5?$CFd?6?$AA@":
	.asciz	"Start: %d; Cut: %d\n"

	.lcomm	__local_stdio_printf_options._OptionsStorage,8,8 # @__local_stdio_printf_options._OptionsStorage
	.section	.rdata,"dr"
initial_costs:                          # @initial_costs
	.ascii	"\002\004\006\t\007\004\006\t\003\006\006\003\t\002\003"

values:                                 # @values
	.ascii	"\b\026\016\031\r\t\025\027\013\024\022\005\020\003\023"

	.p2align	4                               # @costs
costs:
	.ascii	"\000\002\005\t\007\004\006\b\002\006\005\003\t\002\005"
	.ascii	"\002\000\007\013\t\006\b\n\004\b\007\005\013\004\003"
	.ascii	"\005\007\000\016\f\t\013\003\003\013\006\006\016\007\b"
	.ascii	"\t\013\016\000\003\005\005\021\013\003\016\t\005\007\n"
	.ascii	"\007\t\f\003\000\003\002\017\t\002\f\007\002\005\b"
	.ascii	"\004\006\t\005\003\000\002\f\006\002\t\004\005\002\005"
	.ascii	"\006\b\013\005\002\002\000\016\b\004\013\006\003\004\007"
	.ascii	"\b\n\003\021\017\f\016\000\006\016\t\t\021\n\013"
	.ascii	"\002\004\003\013\t\006\b\006\000\b\003\003\013\004\005"
	.ascii	"\006\b\013\003\002\002\004\016\b\000\013\006\003\004\007"
	.ascii	"\005\007\006\016\f\t\013\t\003\013\000\006\016\007\b"
	.ascii	"\003\005\006\t\007\004\006\t\003\006\006\000\t\002\002"
	.ascii	"\t\013\016\005\002\005\003\021\013\003\016\t\000\007\n"
	.ascii	"\002\004\007\007\005\002\004\n\004\004\007\002\007\000\003"
	.asciz	"\005\003\b\n\b\005\007\013\005\007\b\002\n\003"

	.section	.rdata,"dr",discard,"??_C@_02DGLLNMBI@EZ?$AA@"
	.globl	"??_C@_02DGLLNMBI@EZ?$AA@"      # @"??_C@_02DGLLNMBI@EZ?$AA@"
"??_C@_02DGLLNMBI@EZ?$AA@":
	.asciz	"EZ"

	.section	.rdata,"dr",discard,"??_C@_02KPPNMLFJ@FC?$AA@"
	.globl	"??_C@_02KPPNMLFJ@FC?$AA@"      # @"??_C@_02KPPNMLFJ@FC?$AA@"
"??_C@_02KPPNMLFJ@FC?$AA@":
	.asciz	"FC"

	.section	.rdata,"dr",discard,"??_C@_02LDGFHOIO@FU?$AA@"
	.globl	"??_C@_02LDGFHOIO@FU?$AA@"      # @"??_C@_02LDGFHOIO@FU?$AA@"
"??_C@_02LDGFHOIO@FU?$AA@":
	.asciz	"FU"

	.section	.rdata,"dr",discard,"??_C@_02NJNGHICB@IF?$AA@"
	.globl	"??_C@_02NJNGHICB@IF?$AA@"      # @"??_C@_02NJNGHICB@IF?$AA@"
"??_C@_02NJNGHICB@IF?$AA@":
	.asciz	"IF"

	.section	.rdata,"dr",discard,"??_C@_02PHHIKPHE@IR?$AA@"
	.globl	"??_C@_02PHHIKPHE@IR?$AA@"      # @"??_C@_02PHHIKPHE@IR?$AA@"
"??_C@_02PHHIKPHE@IR?$AA@":
	.asciz	"IR"

	.section	.rdata,"dr",discard,"??_C@_02KDGELGKL@JT?$AA@"
	.globl	"??_C@_02KDGELGKL@JT?$AA@"      # @"??_C@_02KDGELGKL@JT?$AA@"
"??_C@_02KDGELGKL@JT?$AA@":
	.asciz	"JT"

	.section	.rdata,"dr",discard,"??_C@_02PBHPPPIM@KE?$AA@"
	.globl	"??_C@_02PBHPPPIM@KE?$AA@"      # @"??_C@_02PBHPPPIM@KE?$AA@"
"??_C@_02PBHPPPIM@KE?$AA@":
	.asciz	"KE"

	.section	.rdata,"dr",discard,"??_C@_02BEEAOEKM@NN?$AA@"
	.globl	"??_C@_02BEEAOEKM@NN?$AA@"      # @"??_C@_02BEEAOEKM@NN?$AA@"
"??_C@_02BEEAOEKM@NN?$AA@":
	.asciz	"NN"

	.section	.rdata,"dr",discard,"??_C@_02BAABAKAN@OY?$AA@"
	.globl	"??_C@_02BAABAKAN@OY?$AA@"      # @"??_C@_02BAABAKAN@OY?$AA@"
"??_C@_02BAABAKAN@OY?$AA@":
	.asciz	"OY"

	.section	.rdata,"dr",discard,"??_C@_02FEKCMNFA@PH?$AA@"
	.globl	"??_C@_02FEKCMNFA@PH?$AA@"      # @"??_C@_02FEKCMNFA@PH?$AA@"
"??_C@_02FEKCMNFA@PH?$AA@":
	.asciz	"PH"

	.section	.rdata,"dr",discard,"??_C@_02LCNFJAAN@PT?$AA@"
	.globl	"??_C@_02LCNFJAAN@PT?$AA@"      # @"??_C@_02LCNFJAAN@PT?$AA@"
"??_C@_02LCNFJAAN@PT?$AA@":
	.asciz	"PT"

	.section	.rdata,"dr",discard,"??_C@_02NCPILLKI@QG?$AA@"
	.globl	"??_C@_02NCPILLKI@QG?$AA@"      # @"??_C@_02NCPILLKI@QG?$AA@"
"??_C@_02NCPILLKI@QG?$AA@":
	.asciz	"QG"

	.section	.rdata,"dr",discard,"??_C@_02ICKFEMNG@SV?$AA@"
	.globl	"??_C@_02ICKFEMNG@SV?$AA@"      # @"??_C@_02ICKFEMNG@SV?$AA@"
"??_C@_02ICKFEMNG@SV?$AA@":
	.asciz	"SV"

	.section	.rdata,"dr",discard,"??_C@_02BMOKPDEL@TO?$AA@"
	.globl	"??_C@_02BMOKPDEL@TO?$AA@"      # @"??_C@_02BMOKPDEL@TO?$AA@"
"??_C@_02BMOKPDEL@TO?$AA@":
	.asciz	"TO"

	.section	.rdata,"dr",discard,"??_C@_02IGCIDAGE@UV?$AA@"
	.globl	"??_C@_02IGCIDAGE@UV?$AA@"      # @"??_C@_02IGCIDAGE@UV?$AA@"
"??_C@_02IGCIDAGE@UV?$AA@":
	.asciz	"UV"

	.addrsig
	.addrsig_sym __local_stdio_printf_options._OptionsStorage
	.globl	_fltused
