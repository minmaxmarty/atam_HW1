.section .data
String: .asciz "plain text with 0456 inside"
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
