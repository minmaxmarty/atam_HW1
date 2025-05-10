.section .data
Address: .quad DataSection
Length: .long 4
Result: .byte 0

.section .data
DataSection:
    .byte 0x12
    .byte 0x34
    .byte 0x34
    .byte 0x12

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
