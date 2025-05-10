.section .data
First: .quad Node1

Result: .byte 0

Node1: .quad Node2
       .int 0
Node2: .quad Node3
       .int 3
Node3: .quad 0
       .int 8

.section .text

    movzbl Result(%rip), %eax
    cmp $2, %al        # סדרה מדרגה שנייה → Result=2
    je success

error:
    mov $60, %rax
    mov $1, %rdi
    syscall

success:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
