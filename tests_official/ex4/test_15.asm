.section .data
Lower: .asciz "nothing_special12345"
Upper: .skip 100

.section .text
    movzbl Upper(%rip), %eax
    cmpb $'N', %al
    jne error
    movzbl Upper+1(%rip), %eax
    cmpb $'O', %al
    jne error
    movzbl Upper+2(%rip), %eax
    cmpb $'T', %al
    jne error
    movzbl Upper+3(%rip), %eax
    cmpb $'H', %al
    jne error
    movzbl Upper+4(%rip), %eax
    cmpb $'I', %al
    jne error
    movzbl Upper+5(%rip), %eax
    cmpb $'N', %al
    jne error
    movzbl Upper+6(%rip), %eax
    cmpb $'G', %al
    jne error
    movzbl Upper+7(%rip), %eax
    cmpb $'S', %al
    jne error
    movzbl Upper+8(%rip), %eax
    cmpb $'P', %al
    jne error
    movzbl Upper+9(%rip), %eax
    cmpb $'E', %al
    jne error
    movzbl Upper+10(%rip), %eax
    cmpb $'C', %al
    jne error
    movzbl Upper+11(%rip), %eax
    cmpb $'I', %al
    jne error
    movzbl Upper+12(%rip), %eax
    cmpb $'A', %al
    jne error
    movzbl Upper+13(%rip), %eax
    cmpb $'L', %al
    jne error


    mov $60, %rax
    xor %rdi, %rdi
    syscall

error:
    mov $60, %rax
    mov $1, %rdi
    syscall

