.section .data
Num1: .long 0x80000000          # 1 bit on (odd)
Num2: .long 0x00000000          # 0 bits on (even)
BitCheck: .byte 0

.section .text
    movzbl BitCheck(%rip), %eax
    cmpb $0, %al                 # odd vs even → should be 0
    je success

error:
    mov $60, %rax
    mov $1, %rdi
    syscall

success:
    mov $60, %rax
    xor %rdi, %rdi
    syscall
