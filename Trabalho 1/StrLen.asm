.data
	str1: .space 100
	msg: .asciiz "O tamanho da string é: "
.text
	li $v0, 8
	la $a0, str1 		# $a0 recebe o endereço de str1
	li $a1, 50
	syscall
	
	la $a0, str1
	
	jal StrLen
	move $s0, $v0
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 10
	syscall
	
	#Implementar a função STRLEN onde ela recebe o endereço de uma string e retorna o tamanho dela
	StrLen: 
		li $t0, 0		# Inicializo $t0,que é o indice	
		While:
			lb $t1, 0($a0) 	# Carrega um unico char da string para $t1
			addi $a0, $a0, 1	# Encrementa 1 no endereço de memoria de $a0
			
			beq $t1, $zero, Sair	# Verifica se $t1, é igual a zero onde zero é um byte invalido, ou seja, fim de string
			addi $t0, $t0, 1 	# Encrementa 1 no indice $t0
			j While 
		Sair: 
			subi $t0, $t0, 1	# Subi para corrigir o erro de 1 que a função estava dando
			move $v0, $t0	
			jr $ra
	
	

