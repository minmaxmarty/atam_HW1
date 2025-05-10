.section .data
Num1: .long 0x0F0F0F0F          # 16 bits on (even)
Num2: .long 0x0F0F0F0E          # 15 bits on (odd)
BitCheck: .byte 0

.section .text
    movzbl BitCheck(%rip), %eax
    cmpb $0, %al                 # even vs odd → should be 0
    je success

error:
    mov $60, %rax
    mov $1, %rdi
    syscall

success:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
