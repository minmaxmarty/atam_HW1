.section .data
Address: .quad DataSection
Length: .long 8
Result: .byte 0

.section .data
DataSection:
    .byte 0xAA
    .byte 0xBB
    .byte 0xCC
    .byte 0xDD
    .byte 0xDD
    .byte 0xCC
    .byte 0xBB
    .byte 0xAA

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
