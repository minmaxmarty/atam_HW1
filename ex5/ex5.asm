.global _start

# used registers: rax, rsi, rbx, r9-13, cl, ch
# cl is 1, if there is a number string 
# ch is 1, if there is a word

.section .text
_start:
    movq String(%rip), %rax # rax = &String[0]
    movq $0, %rsi # i = 0 (index)
    movq $0, %rcx # init rcx = 0 
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
    


check_if_number_init_HW1:
    cmpb $'0', %bl
    je check_number_type_HW1:
    jmp check_if_number_HW1:

check_number_type_HW1:
    incq %rsi
    movq (%rax, %rsi, 1), %rbx
    cmpb $'x', %bl 
    je check_space_after_type_HW1
    cmpb $'b', %bl
    je check_space_after_type_HW1
    jmp check_if_number_HW1

check_space_after_type_HW1: #check edge case of 0x, 0b
    incq %rsi
    movq (%rax, %rsi, 1), %rbx
    cmpb $' ', %bl
    je continue_until_space_HW1
    jmp check_if_number_HW1

inc_and_check_whole_number_HW1:
    incq %rsi
    movq (%rax, %rsi, 1), %rbx
    cmpb $' ', %bl
    cmov $1, %cl
    je continue_HW1
    movq $0, %r12
    movq $0, %r13
    jmp check_if_number_HW1

check_if_number_HW1:
    cmpb $'0', %bl
	cmovae %rcx, %r12
	cmpb $'9', %bl
	cmovbe %rcx, %r13
	cmpq %r12, %r13
    je inc_and_check_whole_number_HW1
    jmp continue_until_space_HW1:
    

continue_HW1:
    incq %rsi
    jmp start_loop_HW1

continue_until_space_HW1:
    cmpb $' ', %bl
    je continue_HW1
    incq %rsi
    movq (%rax, %rsi, 1), %rbx
    jmp continue_until_space_HW1
