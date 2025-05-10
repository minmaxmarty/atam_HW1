.section .data
First: .quad Node1

Result: .byte 0

Node1: .quad Node2
       .int -7
Node2: .quad 0
       .int -2

.section .text
    movzbl Result(%rip), %eax
    cmp $1, %al        # סדרה רגילה: הפרש 5 → Result=1
    je success

error:
    mov $60, %rax
    mov $1, %rdi
    syscall

success:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
