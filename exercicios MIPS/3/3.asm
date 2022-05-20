.data
	msg: .asciiz "Informe o número do quarto: "
	msg1: .asciiz "\nCaminho à direita!"
	msg2: .asciiz "\nCaminho à esquerda!"
	
.text
	#Imprimindo mensagem para digitar o número do quarto
	li $v0, 4
	la $a0, msg
	syscall
	#Lendo o número do quarto e guardando em $t1
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Guardando o inteiro 2 em $t2 e depois dividindo o número do quarto ($t1) por $t2
	li $t2, 2
	div $t1, $t2
	mfhi $s1 #Guardando o resto da divisão inteira em $s1
	
	beqz $s1, direita #Se o resto da divisão ($s1) for igual a zero, ele irá para a label "direita"
	bnez $s1, esquerda #Se o resto da divisão ($s1) for diferente de zero, ele irá para a label "esquerda"
	
	esquerda:
		#Imprimindo mensagem que o quarto está na esquerda do corredor
		li $v0, 4
		la $a0, msg2
		syscall
		
		j end
	direita:
		#Imprimindo mensagem que o quarto está na direita do corredor
		li $v0, 4
		la $a0, msg1
		syscall
		
		j end
	end:
		#Instrução para terminar o programa
		li $v0, 10
		syscall