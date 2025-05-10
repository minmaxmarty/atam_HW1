.section .data
Lower: .asciz "a1b2C3"
Upper: .skip 100

.section .text
    movzbl Upper(%rip), %eax
    cmpb $'A', %al
    jne error
    movzbl Upper+1(%rip), %eax
    cmpb $'1', %al
    jne error
    movzbl Upper+2(%rip), %eax
    cmpb $'B', %al
    jne error
    movzbl Upper+3(%rip), %eax
    cmpb $'2', %al
    jne error
    movzbl Upper+4(%rip), %eax
    cmpb $'C', %al
    jne error
    movzbl Upper+5(%rip), %eax
    cmpb $'3', %al
    jne error
    movzbl Upper+6(%rip), %eax
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
