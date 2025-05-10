.section .data
String: .asciz "div add idiv sub mul imul"
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
