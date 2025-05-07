.global _start

.section .text
_start:

	movq First(%rip), %rax # rax = &node1
	movl 8(%rax), %esi # esi = node1->data (first number)
	xorq %rbx, %rbx # rbx = 0
loop_HW1:
	incb %bl
	movq (%rax), %rax # rax = &node2
	cmpq $0, (%rax)
	je success1_HW1
	movl 8(%rax), %edi # edi = node2->data 
	subl %esi, %edi # edi = edi - esi 
	cmpb $1, %bl
	cmovle %edi, %esp # esp = delta1 
	movl 8(%rax), %esi # node2->data 
	cmpb $2, %bl
	cmovle %edi, %ebp #ebp = delta2
	je	check_HW1
	jmp loop_HW1
check_HW1:
	movb $0, %bl
	cmpl %ebp, %esp
	je same_delta_HW1
	movb $1, %bl
	movl %ebp, %ecx # ecx = last delta 
	subl %esp, %ebp
	jmp diff_delta_HW1 # diff delta
same_delta_HW1:
	movq (%rax), %rax
	cmpq $0, (%rax)
	je success1_HW1
	movl 8(%rax), %edi
	subl %esi, %edi
	movl %edi, %esp
	movl 8(%rax), %esi
	cmpl %ebp, %esp
	jne fail_HW1
	jmp same_delta_HW1
diff_delta_HW1: # ebp = 2 the diff we need to check
	movq (%rax), %rax
	cmpq $0, (%rax)
	je success2_HW1
	movl 8(%rax), %edi
	subl %esi, %edi # new delta
	movl 8(%rax), %esi
	movl %edi, %edx
	subl %ecx, %edi
	cmpl %edi, %ebp
	jne fail_HW1
	movl %edx, %ecx
	jmp diff_delta_HW1
fail_HW1:
	movb $0, Result(%rip)
	jmp exit_HW1
success1_HW1:
	movb $1, Result(%rip)
	jmp exit_HW1
success2_HW1:
	movb $2, Result(%rip)
exit_HW1:
	