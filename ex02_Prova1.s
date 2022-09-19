.data
	msg1: .asciiz "Digite um valor para a: "
	msg2: .asciiz "Digite um valor para b: "	
.text
main:
	
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5	#scanf("%i", a)
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5	#scanf("%i", b)
	syscall
	move $s1, $v0
	
	li $t0, 0	#x = 0
	
	bge $s0, -5, Sair			#If
		blt $s1, 15, Sair		#If
			addi $t0, $t0, 10	#x = 10
	
	Sair: 
		li $v0, 1
		move $a0, $t0	#printf("%i", x)
		syscall
		li $v0, 10
		syscall  
	
	
