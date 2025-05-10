.section .data
Num1: .long 0x12345678          # 13 bits on (odd)
Num2: .long 0x9ABCDEF0          # 19 bits on (odd)
BitCheck: .byte 0

.section .text
    movzbl BitCheck(%rip), %eax
    cmpb $1, %al                 # both odd → should be 1
    je success

error:
    mov $60, %rax
    mov $1, %rdi
    syscall

success:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
