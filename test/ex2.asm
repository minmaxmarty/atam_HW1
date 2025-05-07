.global _start

.section .text
_start:
	movq (Address), %rax 
	movq $0, %rsi
	movq (Length), %rdi
check_HW1:
	cmp %cl, %dl
	jge success_HW1
	movb (%rax, %rsi, 1), %cl
	movb (%rax, %rdi, 1), %dl
	cmp %cl, %dl
	jne fail_HW1
	inc %esi
	dec %edi
	jmp check_HW1
fail_HW1:
	movb $0, Result(%rip)
	jmp exit_HW1
success_HW1:
	movb $1, Result(%rip)
exit_HW1:
