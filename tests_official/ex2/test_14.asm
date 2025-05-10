.section .data
Address: .quad DataSection
Length: .long 7
Result: .byte 0

.section .data
DataSection:
    .byte 0x01
    .byte 0x02
    .byte 0x03
    .byte 0x05
    .byte 0x03
    .byte 0x02
    .byte 0x01

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
