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

StrCmp:
		li $t0, 0	#Armazena o valor do conteudo da String1
		li $t1, 0	#Armazena o valor do conteudo da String2
		
		ValStr:
		lb $t2, 0($a0)
		lb $t3, 0($a1)
		
		move $t0, $t2
		move $t1, $t3
		
		sub $s0, $t0, $t1
		
		bne $s0, $zero, SairStrCmp
		
		addi $a0, $a0, 1
		addi $a1, $a1, 1
		
		bne $t2, 10, ValStr
		bne $t3, 10, ValStr
		
		SairStrCmp:
		
		move $v0, $s0
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
