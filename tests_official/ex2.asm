.global _start

.section .text
_start:
	movq Address(%rip), %rax 
	movq $0, %rsi
	movzx Length(%rip), %rdi # movzx is very important 
	cmpq $0, %rdi
	je success_HW1
	dec %rdi
	cmpq $0, %rdi
	je success_HW1
check_HW1:
	cmp %rsi, %rdi
	jbe success_HW1
	movb (%rax, %rsi, 1), %cl
	movb (%rax, %rdi, 1), %dl
	cmp %cl, %dl
	jne fail_HW1
	inc %rsi
	dec %rdi
	jmp check_HW1
fail_HW1:
	movb $0, Result(%rip)
	jmp exit_HW1
success_HW1:
	movb $1, Result(%rip)
exit_HW1:
