.section .data
Num1: .quad 0x0000000000000000
Num2: .quad 0x0000000000000001
BitCheck: .byte 0

.section .text

    movzbl BitCheck(%rip), %eax
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
