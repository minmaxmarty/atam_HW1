.section .data
First: .quad Node1

Result: .byte 0

Node1: .quad Node2
       .int 7
Node2: .quad Node3
       .int 14
Node3: .quad Node4
       .int 21
Node4: .quad Node5
       .int 28
Node5: .quad Node6
       .int 35
Node6: .quad 0
       .int 42

.section .text
    movzbl Result(%rip), %eax
    cmp $1, %al
    je success

error:
    mov $60, %rax
    mov $1, %rdi
    syscall

success:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
