.global _start

# used registers: 

.section .text
_start:
    movq String(%rip), %rax # rax = &String[0]
    movq $0, %rsi # i = 0 (index)
start_loop_HW1:
    movq (%rax, %rsi, 1), %rbx
    cmpb $'a', %bl
    je check_add_HW1
    cmpb $'s', %bl
    je check_sub_HW1
    cmpb $'m', %bl 
    je check_mul_HW1
    cmpb $'d', %bl
    je check_div_HW1
    cmpb $'i', %bl
    je continue_HW1
    jmp check_if_number_HW1



check_if_number_HW1:
    

continue_HW1:
    incq %rsi
    jmp start_loop_HW1

    
    
