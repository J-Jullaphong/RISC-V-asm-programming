.data
a: .word 1, 2, 3, 4, 5
b: .word 6, 7, 8, 9, 10
output: .string "The dot product is: "

.text
main:
    addi x5, x0, 0 # let x5 be i and set it to 0
    addi x6, x0, 0 # let x6 be sop and set it to 0
    
    # load base addresses of a and b arrays.
    la x7, a # loading the address of a to x7
    la x8, b # loading the address of b to x8
    
    addi x9, x0, 5 # let x9 be the size of the two arrays (5)
    
loop:
    beq x5, x9, exit # check if i == 5, if so goto exit
    
    slli x18, x5, 2 # set x18 to i*4
    
    add x19, x7, x18 # add i*4 to the base address of a and put it to x19
    lw x20, 0(x19) # x20 has a[i]
    
    add x21, x8, x18 # add i*4 to the base address of b and put it to x21
    lw x22, 0(x21) # x22 has b[i]
    
    mul x23, x20, x22 # let x23 be a[i] * b[i]
    add x6, x6, x23 # sop += a[i] * b[i]
    
    addi x5, x5, 1 # i++
    j loop
    
exit:
    # print_string; output
    addi a0, x0, 4
    la a1, output
    ecall
    
    # print_int; sop
    addi a0, x0, 1
    add a1, x0, x6
    ecall
    
    # print a newline character; use print_character
    addi a0, x0, 11
    addi a1, x0, 10
    ecall
    
    # exit cleanly
    addi a0, x0, 10 
    ecall
