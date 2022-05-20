.data
	msg0: .asciiz "Digite a sua altura: "
	msg: .asciiz "Digite seu peso: "
	msgimc: .asciiz "\nSeu imc é de: "
	zero: .float 0.0 
	
	#Váriaveis com os valores para as condicionais
	condição1: .float 16.0
	condição2: .float 17.0
	condição3: .float 18.5
	condição4: .float 25.0
	condição5: .float 30.0
	condição6: .float 35.0
	condição7: .float 40.0
	
	#Mensagens para as condicionais
	msg1:.asciiz "\nMagreza grave!"
	msg2:.asciiz "\nMagreza moderada!"
	msg3:.asciiz "\nMagreza leve!"
	msg4:.asciiz "\nSaudável!"
	msg5:.asciiz "\nSobrepeso!"
	msg6:.asciiz "\nObesidade Grau 1!"
	msg7:.asciiz "\nObesidade Grau 2 (Severa)!"
	msg8:.asciiz "\nObesidade Grau 3 (Mórbida)!"
.text
	#Imprimindo mensagem para usuário digitar a altura
	li $v0, 4
	la $a0, msg0
	syscall
	
	#Lendo o número e guardando em $f0
	li $v0, 6
	syscall
	
	#$f3 está com o valor da altura
	lwc1 $f1, zero
	add.s $f3, $f1, $f0
	
	#Imprimindo mensagem para usuário digitar o peso
	li $v0, 4
	la $a0, msg
	syscall
	
	#Lendo o número e guardando em $f0
	li $v0, 6
	syscall
	
	#$f4 está com o valor do peso
	lwc1 $f1, zero
	add.s $f4, $f1, $f0
	
	#multiplicando $f3 por $f3 e guardando em $f1 (altura * altura)
	mul.s $f6, $f3, $f3
	
	#Divindo $f4 por $f3 e guardando em $f5 ( peso/ altura*altura) - IMC ($f5)
	div.s $f5, $f4, $f6
	
	#Printando mensagem na tela
	li $v0, 4
	la $a0, msgimc
	syscall 
	#printando IMC na tela
	add.s $f12, $f5, $f1
	li $v0, 2
	syscall
	
	#Fazendo registradores de ponto flutuante receberem valores para usar nas condicionais
	lwc1 $f20, condição1 # $f20 recebe 16
	lwc1 $f21, condição2 # $f21 recebe 17
	lwc1 $f22, condição3 # $f22 recebe 18.5
	lwc1 $f23, condição4 # $f23 recebe 25
	lwc1 $f24, condição5 # $f24 recebe 30
	lwc1 $f25, condição6 # $f25 recebe 35
	lwc1 $f26, condição7 # $f26 recebe 40
	
	#condicionais
	c.lt.s $f5, $f20 #Se imc < 16
	bc1t if
	bc1f else
	
	if: #Caso seja menor que 16
		li $v0, 4
		la $a0, msg1
		syscall
		j end
	else: #Se for maior que 16 
		c.lt.s $f5, $f21 #Se imc < 17
		bc1t if1
		bc1f else1
		
	if1: #Caso seja menor que 17
		li $v0, 4
		la $a0, msg2
		syscall
		j end
	else1:#Se for maior que 17
		c.lt.s $f5, $f22 #Se imc < 18.5
		bc1t if2
		bc1f else2
		
	if2: #Caso seja menor que 18.5
		li $v0, 4
		la $a0, msg3
		syscall
		j end
	else2: #se for maior que 18.5
		c.lt.s $f5, $f23 #Se imc < 25
		bc1t if3
		bc1f else3
	
	if3: #Caso seja menor que 25
		li $v0, 4
		la $a0, msg4
		syscall
		j end
	else3: #Se for maior que 25
		c.lt.s $f5, $f24 #Se imc < 30
		bc1t if4
		bc1f else4
		
	if4: #Caso seja menor que 30
		li $v0, 4
		la $a0, msg5
		syscall
		j end
	else4: #Caso seja maior que 30
		c.lt.s $f5, $f25 #Se imc < 35
		bc1t if5
		bc1f else5
		
	if5: #Caso seja menor que 35
		li $v0, 4
		la $a0, msg6
		syscall
		j end
	else5: #Se for maior que 35
		c.lt.s $f5, $f26 #Se imc < 40
		bc1t if6
		bc1f else6
		
	if6: #Caso seja menor que 40
		li $v0, 4
		la $a0, msg7
		syscall
		j end
	else6: #Caso seja maior que 40
		li $v0, 4
		la $a0, msg8
		syscall
		j end
		
	end:
		li $v0, 10
		syscall