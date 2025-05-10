.section .data
String: .asciz "this is an add operation"
Result: .byte 0

.section .text
    movzbl Result(%rip), %eax
    cmpb $1, %al
    je success

error:
    mov $60, %rax
    mov $1, %rdi
    syscall

success:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
