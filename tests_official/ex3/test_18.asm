.section .data
First: .quad Node1

Result: .byte 0

Node1: .quad Node2
       .int 2
Node2: .quad Node3
       .int 3
Node3: .quad Node4
       .int 5
Node4: .quad Node5
       .int 8
Node5: .quad 0
       .int 13

.section .text
    movzbl Result(%rip), %eax
    cmp $0, %al
    je success

error:
    mov $60, %rax
    mov $1, %rdi
    syscall

success:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
