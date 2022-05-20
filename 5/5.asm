.data
	#Mensagens da piscina
	msgcomp: .asciiz "Digite o comprimento da piscina em metros: "
	msgalt: .asciiz "Digite a altura da piscina em metros: "
	msglarg: .asciiz "Digite a largura da piscina em metros: "
	
	#Mensagens do ladrilho
	msgaltlad: .asciiz "\nInforme a altura do ladrilho em centímetros: "
	msgcomplad: .asciiz "Informe o comprimento do ladrilho em centímetros: "
	msgtotladrilhos: .asciiz "\nA quantidade total de ladrilhos a serem comprados é de: "
	
	#Variáveis para usar nos cálculos
	mult2: .float 2.0
	divdezmil: .float 10000.0
	
.text
	#Imprimindo mensagem para o usuário digitar o comprimento da piscina
	li $v0, 4
	la $a0, msgcomp
	syscall
	#Lendo o comprimento e guardando em $f20
	li $v0, 6
	syscall
	mov.s $f20, $f0
	
	#Imprimindo mensagem para o usuário digitar a altura da piscina
	li $v0, 4
	la $a0, msgalt
	syscall
	#Lendo a altura e guardando em $f21
	li $v0, 6
	syscall
	mov.s $f21, $f0
	
	#Imprimindo mensagem para o usuário digitar a largura da piscina
	li $v0, 4
	la $a0, msglarg
	syscall
	#Lendo a largura e guardando em $f22
	li $v0, 6
	syscall
	mov.s $f22, $f0
	
	#Guardando 2.0 dentro do registrador de ponto flutuante $f19
	lwc1 $f19, mult2
	#Guardando 10000.0 dentro do registrador de ponto flutuante $f18
	lwc1 $f18, divdezmil
	
	#Calculando a área da piscina: 
	# $f25 = 2 * largura * altura
	mul.s $f25, $f19, $f22
	mul.s $f25, $f25, $f21
	# $f26 = 2 * comprimento * altura
	mul.s $f26, $f19, $f20
	mul.s $f26, $f26, $f21
	# $f27 = largura * comprimento
	mul.s $f27, $f22, $f20
	# $f28 = área da piscina (Soma de $f25 + $f26 + $f27)
	add.s $f28, $f25, $f26
	add.s $f28, $f28, $f27
	
	#Imprimindo mensagem para o usuário digitar a altura do ladrilho
	li $v0, 4
	la $a0, msgaltlad
	syscall
	#Lendo a altura do ladrilho e guardando em $f29
	li $v0, 6
	syscall
	mov.s $f29, $f0
	
	#Imprimindo mensagem para o usuário digitar o comprimento do ladrilho
	li $v0, 4
	la $a0, msgcomplad
	syscall
	#Lendo o comprimento do ladrilho e guardando em $f30
	li $v0, 6
	syscall
	mov.s $f30, $f0
	
	#Calculando a área do ladrilho
	# $f31 = (altura ladrilho($f29) * comprimento ladrilho($f30) / 10000($f18)
	mul.s $f31, $f29, $f30
	div.s $f31, $f31, $f18
	
	#Calculando o total de ladrilhos a serem comprados
	# $f1 = área da piscina($f28) / área do ladrilho($f31)
	div.s $f1, $f28, $f31
	
	#Imprimindo mensagem do total de ladrilhos a serem comprados
	li $v0, 4
	la $a0, msgtotladrilhos
	syscall	
	#Imprimindo a quantidade de ladrilhos a serem comprados
	li $v0, 2
	mov.s $f12, $f1
	syscall
	
	#Encerrando programa 
	li $v0, 10	