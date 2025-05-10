.section .data
Lower: .asciz "goodluck2025!!"
Upper: .skip 100

.section .text
    movzbl Upper(%rip), %eax
    cmpb $'G', %al
    jne error
    movzbl Upper+1(%rip), %eax
    cmpb $'O', %al
    jne error
    movzbl Upper+2(%rip), %eax
    cmpb $'O', %al
    jne error
    movzbl Upper+3(%rip), %eax
    cmpb $'D', %al
    jne error
    movzbl Upper+4(%rip), %eax
    cmpb $'L', %al
    jne error
    movzbl Upper+5(%rip), %eax
    cmpb $'U', %al
    jne error
    movzbl Upper+6(%rip), %eax
    cmpb $'C', %al
    jne error
    movzbl Upper+7(%rip), %eax
    cmpb $'K', %al
    jne error
    movzbl Upper+8(%rip), %eax
    cmpb $'2', %al
    jne error
    movzbl Upper+9(%rip), %eax
    cmpb $'0', %al
    jne error
    movzbl Upper+10(%rip), %eax
    cmpb $'2', %al
    jne error
    movzbl Upper+11(%rip), %eax
    cmpb $'5', %al
    jne error
    movzbl Upper+12(%rip), %eax
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
