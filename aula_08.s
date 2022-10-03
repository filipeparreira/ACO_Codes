.data
    msg: .asciiz "O fatorial é: \n\n"
    
.text

main:

    li $a0, 5
    jal fat
    
    move $t0, $v0
    
    la $a0, msg
    li $v0, 4
    syscall   
    
    
    move $a0, $t0
    li $v0, 1
    syscall
    
    li $v0, 10
    syscall
    
fat:
    addi $sp, $sp, -8
    sw $a0, 4($sp)
    sw $ra, 8($sp)

    slti $t0, $a0, 1
    beq $t0, $zero, L1
    
    li $v0, 1
    addi $sp, $sp, 8
    jr $ra   
    
L1:
    addi $a0, $a0, -1
    jal fat

    lw $a0, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 8

    mul $v0, $v0, $a0
    
    jr $ra

