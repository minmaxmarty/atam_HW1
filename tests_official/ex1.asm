.global _start

.section .text
_start:
	movl (Num1), %eax  
	movl (Num2), %ebx
	xorl %ebx, %eax
	movb %al, %bl
	andb $1, %bl
loop_HW1:
	shrl $1, %eax
	cmpl $0, %eax
	je exitLoop_HW1
	movb %al, %cl
	andb $1, %cl
	xorb %cl, %bl
	jmp loop_HW1	
exitLoop_HW1: 
	cmpb $0, %bl
	movb $1, BitCheck(%rip)
	je exit_HW1
	movb $0, BitCheck(%rip)
exit_HW1:
