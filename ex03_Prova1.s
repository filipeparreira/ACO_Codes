.data
	msg1: .asciiz "Digite o valor do primeiro inteiro: "
	msg2: .asciiz "Digite o valor do segundo inteiro: "
	msg3: .asciiz "A multiplicação entre os dois inteiros é: "
.text
main:
	
	#Recebendo o valor do primeiro inteiro 
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	
	#Recebendo o valor do segundo inteiro
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $t3, -1
	
	#Verifica se o numero é positivo ou negativo
	bgt $s0, $zero, Neg
		addi $t2, $t2, 1		
		mul $s0, $s0, $t3
	Neg:
		bgt $s1, $zero, While
			addi $t2, $t2, 1
			mul $s1, $s1, $t3
	
	#Começo das instruções Laço
	While: 
		bge $t0, $s1, Saida 
		add $t1, $s0, $t1
		addi $t0, $t0, 1
		j While
	#Final das instruções Laço
	
	#Saida para caso os numeros sejam positivos ou ambos negativos
	Saida:
		beq $t2, 1, SaidaN
		li $v0, 4
		la $a0, msg3
		syscall
		li $v0, 1
		move $a0, $t1
		syscall
		li $v0, 10
		syscall
	
	
	#Saida para caso um dos itens seja negativo
	SaidaN:
		sub $t1, $zero, $t1
		li $v0, 4
		la $a0, msg3
		syscall
		li $v0, 1
		move $a0, $t1
		syscall
		li $v0, 10
		syscall
		
		
		
		
