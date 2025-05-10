.section .data
Num1: .long 0x00000001          # 1 bit on (odd)
Num2: .long 0x00000002          # 1 bit on (odd)
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
