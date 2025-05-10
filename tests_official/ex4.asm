.global _start

.section .text
_start:
	movq $Lower, %rax # leaq Lower(%rip), %rax is an alternative 
	movq $Upper, %rbx
	movq $0, %rdx
	movq $0, %rsi # init index_L = i = 0
	movq $0, %rdi # init index_U = j = 0
	movq $1, %rcx
	
loop_HW1:
	movq $0, %r8
	movq $0, %r9
	movb (%rax, %rsi, 1), %dl # dl = Lower[i]
	cmpb $0, %dl
	je exit_HW1
	cmpb $'A', %dl
	cmovae %rcx, %r8
	cmpb $'Z', %dl
	cmovbe %rcx, %r9
	cmpq %r8, %r9
	je upperCase_or_number_HW1 
	movq $0, %r8
	movq $0, %r9
	cmpb $'a', %dl
	cmovae %rcx, %r8
	cmpb $'z', %dl
	cmovbe %rcx, %r9
	cmpq %r8, %r9
	je lowerCase_HW1
	movq $0, %r8
	movq $0, %r9
	cmpb $'0', %dl
	cmovae %rcx, %r8
	cmpb $'9', %dl
	cmovbe %rcx, %r9
	cmpq %r8, %r9
	je upperCase_or_number_HW1
	jmp increment_i_HW1
	
lowerCase_HW1:
	movb $'a', %r9b
	movb $'A', %r8b
	subb %r8b, %r9b
	subb %r9b, %dl
	jmp upperCase_or_number_HW1
	
upperCase_or_number_HW1:
	movb %dl, (%rbx, %rdi, 1) # Upper[j] = dl
	jmp increment_i_j_HW1
	
increment_i_j_HW1:
	incq %rdi
	incq %rsi
	jmp loop_HW1
	
increment_i_HW1:
	incq %rsi
	jmp loop_HW1

exit_HW1:
	

