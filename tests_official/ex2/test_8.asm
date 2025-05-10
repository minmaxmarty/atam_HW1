.section .data
Address: .quad DataSection
Length: .long 4
Result: .byte 0

.section .data
DataSection:
    .byte 0x11
    .byte 0x22
    .byte 0x33
    .byte 0x44

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
