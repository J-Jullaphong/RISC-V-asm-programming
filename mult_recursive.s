.text
main:
    # pass the first argument to a0
    # pass the second argument to a1
    addi a0, x0, 110
    addi a1, x0, 50
    
    jal mult
    
    # print result
    mv a1, a0 # by convention the reutrn value is always in a0
    addi a0, x0, 1
    ecall
    
    # print newline
    addi a0, x0, 11
    addi a1, x0, 10
    ecall
    
    # exit cleanly
    addi a0, x0, 10
    ecall
    
mult:
    # base case
    # compare a1 with 1, if the two are equal you exit the mult function
    addi t0, x0, 1 # declare 1
    beq a1, t0, exit_base_case # if (b == 1), goes to exit_base_case

    # recursive case
    addi sp, sp, -4
    sw ra, 0(sp) # storing the ra value on to the stack
    
    # mult(a, b-1);
    
    # save a0 on to the stack
    addi sp, sp, -4
    sw a0, 0(sp)
    
    # pass the first argument to a0
    addi a1, a1, -1
    jal mult
    
    # restore the original a value before the call to mult
    lw t1, 0(sp)
    addi sp, sp, 4
    
    # a + mult(a, b-1)
    add a0, a0, t1
    
    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra
    
exit_base_case:
    jr ra
