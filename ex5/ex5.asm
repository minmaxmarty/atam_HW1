.global _start

# used registers: rax, rsi, rbx, r9-13
# edx is 1, if there is a number string 
# edi is 1, if there is a word

.section .text
_start: 
    movq String(%rip), %rax # rax = &String[0]
    movq $0, %rsi # i = 0 (index)
    movq $0, %rcx # init rcx = 0 
    
reset_words_HW1:
    movq $0x61646420, %r8   # "add"
    movq $0x73756220, %r9   # "sub"
    movq $0x6D756C20, %r10  # "mul"
    movq $0x64697620, %r11  # "div"

start_loop_HW1:
    movl %edx, %r12d
    movl %edi, %r13d
    andb %r13b, %r12b
    cmpb $1, %r12b
    je exit_3_HW1 # no point in continuing to search
    movq $0, %r12
    movq (%rax, %rsi, 1), %rbx
    cmpb $0, %bl
    je choose_exit_HW1 # reached '\0'
    cmpb $'a', %bl
    je check_add_HW1
    cmpb $'s', %bl
    je check_sub_HW1
    cmpb $'m', %bl 
    je check_mul_HW1
    cmpb $'d', %bl
    je check_div_HW1
    cmpb $'i', %bl
    je check_after_i_HW1
    jmp check_if_number_HW1
    
check_after_i_HW1: # in case of ii...
    incq %rsi
    movq (%rax, %rsi, 1), %rbx
    cmpb $'i', %bl
    je continue_until_space_HW1
    jmp start_loop_HW1

check_add_HW1:
    cmpb $0, %r8b
    je check_if_space
    cmpb %r8b, %bl
    jne continue_until_space_HW1
    shrq $8, %r8
    incq %rsi
    movq (%rax, %rsi, 1), %rbx
    jmp check_add_HW1

check_sub_HW1:
    cmpb $0, %r9b
    je check_if_space
    cmpb %r9b, %bl
    jne continue_until_space_HW1
    shrq $8, %r9
    incq %rsi
    movq (%rax, %rsi, 1), %rbx
    jmp check_sub_HW1

check_mul_HW1:
    cmpb $0, %r10b
    je check_if_space
    cmpb %r10b, %bl
    jne continue_until_space_HW1
    shrq $8, %r10
    incq %rsi
    movq (%rax, %rsi, 1), %rbx
    jmp check_mul_HW1

check_div_HW1:
    cmpb $0, %r11b
    je check_if_space
    cmpb %r11b, %bl
    jne continue_until_space_HW1
    shrq $8, %r11
    incq %rsi
    movq (%rax, %rsi, 1), %rbx
    jmp check_div_HW1

check_if_space:
    cmp $' ', %bl
    movl $1, %r12d
    cmove %r12d, %edi
    jmp continue_until_space_HW1

check_if_number_init_HW1:
    cmpb $'0', %bl
    je check_number_type_HW1
    jmp check_if_number_HW1

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
    movl $1, %r12d
    cmove %r12d, %edx
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
    jmp continue_until_space_HW1
    

continue_HW1:
    incq %rsi
    jmp start_loop_HW1

continue_until_space_HW1:
    cmpb $' ', %bl
    je continue_HW1
    incq %rsi
    movq (%rax, %rsi, 1), %rbx
    jmp continue_until_space_HW1

exit_3_HW1:
    movb $3, Result(%rip)
    jmp exit_HW1
choose_exit_HW1:
    cmpl $1, %edx
    je exit_2_HW1
    cmpl $1, %edi
    je exit_1_HW1
    movb $0, Result(%rip)
    jmp exit_HW1
exit_1_HW1:
    movb $1, Result(%rip)
    jmp exit_HW1
exit_2_HW1:
    movb $2, Result(%rip)
    jmp exit_HW1
exit_HW1:
