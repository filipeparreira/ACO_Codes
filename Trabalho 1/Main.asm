.data
	msgInicial: .asciiz "Funções: \n[0] - StrLen \n[1] - StrCpy \n[2] - StrCat \n[3] - StrCmp \nSelecione uma das opções: "
	msgOpInval: .asciiz "O opção escolhida é invalida!!"
	str1: .space 100
	str2: .space 100
	msgStr1: .asciiz "\nStr1 - Digite uma frase ou palavra de até 100 caracteres: "
	msgStr2: .asciiz "Str2 - Digite uma frase ou palavra de até 100 caracteres: " 
	#--------------StrLen--------------
	msgStrLen: .asciiz "\nO tamanho de Str1 é: "
	#--------------StrCpy e StrCat--------------
	msgStrA1: .asciiz "\nStrings antes da função: \nStr1: "
	msgStrA2: .asciiz "Str2: "
	msgStrD1: .asciiz "\nStrings depois da função: \nStr1: "
	msgStrD2: .asciiz "Str2: "
	#--------------StrCmp--------------
	msgStrCmp1: .asciiz "\nPossiveis valores de retorno (n) da função StrCmp: \nn = 0 - Str1 = Str2\nn > 0 - Str1 > Str2\nn < 0 - Str1 < Str2"
	msgStrCmp2: .asciiz "\n\nStr1: "
	msgStrCmp3: .asciiz "Str2: "
	msgStrCmp4: .asciiz "\nn =  "
.text
main:
	#Mensagem Inicial solicitando ao usuario uma opção, e armazenando a opção que ele escolheu
	la $a0, msgInicial
	jal ImprimeStr
	li $v0, 5
	syscall
	move $a0, $v0
	
	#Chamando a função que analisa a opção escolhida pelo usuario
	jal AnaliseOp
	move $s0, $a0	#Movendo para $s0, o valor da função escolhida

	#Analizando qual função chamar
	beq $s0, 0, FuncStrLen
	beq $s0, 1, FuncStrCpy
	beq $s0, 2, FuncStrCat
	beq $s0, 3, FuncStrCmp	
	jal FinalizaProg
	
	#--------------StrLen--------------
	FuncStrLen:
	la $a0, msgStr1
	jal ImprimeStr
	
	la $a0, str1
	jal LeStr
	
	jal StrLen
	
	move $s0, $v0
	
	la $a0, msgStrLen
	jal ImprimeStr
	move $a0, $s0
	jal ImprimeInt
	jal FinalizaProg
	
	#--------------StrCpy--------------
	FuncStrCpy:
	la $a0, msgStr1
	jal ImprimeStr
	la $a0, str1
	jal LeStr
	
	la $a0, msgStr2
	jal ImprimeStr 
	la $a0, str2
	jal LeStr
	
	la $a0, msgStrA1
	jal ImprimeStr
	la $a0, str1
	jal ImprimeStr
	la $a0, msgStrA2
	jal ImprimeStr
	la $a0, str2
	jal ImprimeStr
	
	la $a0, str1
	la $a1, str2
	
	jal StrCpy 
	
	la $a0, msgStrD1
	jal ImprimeStr
	la $a0, str1
	jal ImprimeStr
	la $a0, msgStrD2
	jal ImprimeStr
	la $a0, str2
	jal ImprimeStr
	
	jal FinalizaProg
	
	#--------------StrCat--------------
	FuncStrCat:
	la $a0, msgStr1
	jal ImprimeStr
	la $a0, str1
	jal LeStr
	
	la $a0, msgStr2
	jal ImprimeStr 
	la $a0, str2
	jal LeStr
	
	la $a0, msgStrA1
	jal ImprimeStr
	la $a0, str1
	jal ImprimeStr
	la $a0, msgStrA2
	jal ImprimeStr
	la $a0, str2
	jal ImprimeStr
	
	la $a0, str1
	la $a1, str2
	
	jal StrCat
	
	la $a0, msgStrD1
	jal ImprimeStr
	la $a0, str1
	jal ImprimeStr
	la $a0, msgStrD2
	jal ImprimeStr
	la $a0, str2
	jal ImprimeStr
	
	jal FinalizaProg
	
	#--------------StrCmp--------------
	FuncStrCmp:
	la $a0, msgStr1
	jal ImprimeStr
	la $a0, str1
	jal LeStr
	
	la $a0, msgStr2
	jal ImprimeStr 
	la $a0, str2
	jal LeStr
	
	la $a0, str1
	la $a1, str2
	
	jal StrCmp
	
	move $s0, $v0
	
	la $a0, msgStrCmp1
	jal ImprimeStr
	
	la $a0, msgStrCmp2
	jal ImprimeStr
	la $a0, str1
	jal ImprimeStr
	
	la $a0, msgStrCmp3
	jal ImprimeStr	
	la $a0, str2
	jal ImprimeStr
	
	la $a0, msgStrCmp4
	jal ImprimeStr
	move $a0, $s0
	jal ImprimeInt
	
	jal FinalizaProg	
		
	#-------------------- Funções --------------------
	AnaliseOp:
		sw $ra, 0($sp)	# Guardando o valor do $ra
		bge $a0, $zero, OpCerto
		j OpInvalida
		OpCerto:
		ble $a0, 3, Sair
		j OpInvalida
		OpInvalida:
		la $a0, msgOpInval
		jal ImprimeStr
		jal FinalizaProg
		lw $ra, 0($sp)
		jr $ra
		Sair:
		lw $ra, 0($sp)
		jr $ra		
	
	StrLen: 
		li $t0, 0		# Inicializo $t0,que é o contador	
		While:
		lb $t1, 0($a0) 	# Carrega um unico char da string para $t1
		addi $a0, $a0, 1	# Encrementa 1 no endereço de memoria de $a0
			
		beq $t1, $zero, SairStrLen	# Verifica se $t1, é igual a zero onde zero é um byte invalido, ou seja, fim de string
		addi $t0, $t0, 1 	# Encrementa 1 no indice $t0
		j While 
		SairStrLen: 
		subi $t0, $t0, 1	# Subi para corrigir o erro de 1 que a função estava dando
		move $v0, $t0	
		jr $ra
	
	StrCpy:
		#Inicio do laço de repetição - Zera String1
		lb $t0, 0($a0) 
		sb $zero, 0($a0)
		addi $a0, $a0, 1
		addi $t1, $t1, 1
		bne $t0, $zero, StrCpy	#Final do laço de repetição
		sub $a0, $a0, $t1
		Copia:			# Função que copia a Str2 para a Str1
			lb $t2, 0($a1)
			sb $t2, 0($a0)
			addi $a1, $a1, 1
			addi $a0, $a0, 1
			beq $t2, $zero, SairStrCpy
			j Copia
		SairStrCpy:
			jr $ra
	
	StrCat:
		#Inicio do laço de repetição - Conta Str1 
		addi $t1, $t1, 1
		lb $t0, 0($a0)
		addi $a0, $a0, 1
		bne $t0, $zero, StrCat	#Final do laço de repetição
	
		subi $a0, $a0, 2	#Subi de 2 do endereço da String1 para que "exclua" o \n
	
		Concatena:		#Concatena as duas Strings
			lb $t0, 0($a1)
			sb $t0, 0($a0)
			addi $a1, $a1, 1
			addi $a0, $a0, 1
			beq $t0, $zero, SairStrCat
			j Concatena
		SairStrCat:
			jr $ra
	
	StrCmp:
		li $t0, 0	#Armazena o valor do conteudo da String1
		li $t1, 0	#Armazena o valor do conteudo da String2
		
		ValStr1:
		lb $t2, 0($a0)
		add $t0, $t0, $t2
		addi $a0, $a0, 1
		bne $t2, 10, ValStr1
		
		ValStr2:
		lb $t2, 0($a1)
		add $t1, $t1, $t2
		addi $a1, $a1, 1
		bne $t2, 10, ValStr2
		
		sub $v0, $t0, $t1
		jr $ra
			
	ImprimeStr:
		li $v0, 4
		syscall
		jr $ra
		
	ImprimeInt:
		li $v0, 1
		syscall
		jr $ra
	
	LeStr:
		li $v0, 8
		li $a1, 100
		syscall
		jr $ra
		
	FinalizaProg:
		li $v0, 10
		syscall
		jr $ra