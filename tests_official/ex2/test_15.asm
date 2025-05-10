.section .data
Address: .quad DataSection
Length: .long 8
Result: .byte 0

.section .data
DataSection:
    .byte 0x10
    .byte 0x20
    .byte 0x30
    .byte 0x40
    .byte 0x50
    .byte 0x60
    .byte 0x70
    .byte 0x80

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
