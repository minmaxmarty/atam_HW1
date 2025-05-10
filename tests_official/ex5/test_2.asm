.section .data
String: .asciz "the number is 0x345 here"
Result: .byte 0

.section .text
    movzbl Result(%rip), %eax
    cmpb $2, %al
    je success

error:
    mov $60, %rax
    mov $1, %rdi
    syscall

success:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
