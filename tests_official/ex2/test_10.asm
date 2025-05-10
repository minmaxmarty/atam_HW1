.section .data
Address: .quad DataSection
Length: .long 5
Result: .byte 0

.section .data
DataSection:
    .byte 0xA0
    .byte 0xB1
    .byte 0xC3
    .byte 0xB1
    .byte 0xA0

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
