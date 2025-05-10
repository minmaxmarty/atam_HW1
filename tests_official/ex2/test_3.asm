.section .data
Address: .quad DataSection
Length: .long 2
Result: .byte 0

.section .data
DataSection:
    .byte 0xAB
    .byte 0xAB

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
