.data
	palavra: .asciiz "Banana"
	frase: .asciiz "\nA quantidade de letras que tem na palavra é: "
.text
main: 
	la $a0, palavra
	li $v0, 4
	syscall
	
	li $a1, 6
	
	jal StrLen
	move $s0, $v0
	
	la $a0, frase
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
	StrLen:
		li $t0, 0 #Inicializando o contador
		sw $ra, 0($sp)
		
		While:
		lb $t1, 0($a0)
		addi $a0, $a0, 1
		
		
		beq $t1, $zero, SairStrLen
		addi $t0, $t0, 1
		j While
		
		SairStrLen:
		move $v0, $t0
		lw $ra, 0($sp)
		jr $ra
		
	
	