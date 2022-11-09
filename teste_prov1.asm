.data
	msgSalario: .asciiz "Entre com seu salário: R$ "
	msgDivida: .asciiz "\nEntre com sua dívida: R$ "
	espaco: .byte '\n'
	saldo: .asciiz "\nO saldo da sua conta é: R$ "
.text
main:
	li $t0, 0 #Salario = 0
	li $t1, 0 #Divida = 0
	li $t3, 0 #Saldo = 0
	
	la $a0, msgSalario
	jal ImprimeStr
	jal LeInt
	move $t0, $v0
	
	la $a0, msgDivida
	jal ImprimeStr
	jal LeInt
	move $t1, $v0
	
	move $a0, $t0
	move $a1, $t1
	
	jal SaldoDisponivel
	
	move $a0, $v0
	
	jal PrintSaldo
	
	li $v0, 10
	syscall
			

	PrintSaldo:
		addi $sp, $sp, -8
		sw $ra, 0($sp)
		sw $a0, 4($sp)
		
		la $a0, saldo
		li $v0, 4
		syscall
		
		lw $a0, 4($sp)
		jal ImprimeInt
		
		lw $ra, 0($sp)
		
		addi $sp, $sp, 8
		jr $ra
		
	
	SaldoDisponivel:
		addi $sp, $sp, -4
		sw $ra, 0($sp)
				
		li $a2, 0 #saldo = 0
		#Chamando a função somaSaldo
		jal SomaSaldo	#entrada, saldo e o salario
		
		move $a2, $v0
		
		#Chamando a função SubtraiSaldo
		jal SubtraiSaldo #entrada, saldo e a divida
		#retorna o saldo em $v0
		
		lw $ra, 0($sp)

		addi $sp, $sp, 4
				
		jr $ra
		
	
	SomaSaldo:
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		
		#Soma o saldo ao salario e retorna o saldo
		add $a2, $a2, $a0 #saldo = saldo + salario
		move $v0, $a2
		
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra
	
	SubtraiSaldo:
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		
		#Subtrai a divida do valor do saldo e retorna saldo
		sub $a2, $a2, $a1
		move $v0, $a2
		
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra
		
	
	ImprimeStr:
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		
		li $v0, 4
		syscall
		
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra
	
	ImprimeInt:
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		
		li $v0, 1
		syscall
		
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra
			
	LeInt:
		li $v0, 5
		syscall
		
		jr $ra
