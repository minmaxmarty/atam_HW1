.section .data
Lower: .asciz "##!!**"
Upper: .skip 100

.section .text
    movzbl Upper(%rip), %eax
    cmpb $0, %al
    jne error

success:
    mov $60, %rax
    xor %rdi, %rdi
    syscall

error:
    mov $60, %rax
    mov $1, %rdi
    syscall
