.data
	msgpular: .asciiz "\n\n"
	msgvenda: .asciiz "Digite o valor da sua venda: "
	msgsalariofinal: .asciiz "O seu salário fixo + comissão foi de: R$ "
	msgfinalizar: .asciiz "\nDigite 1 para continuar ou qualquer outro número inteiro para finalizar: "
	
	#Valores para cálculos
	valor1: .float 1500.0
	valor2: .float 0.10
	valor3: .float 0.2
	valor4: .float 1200.0
.text
	#Guardando 1 no registrador de ponto fixo $t0
	li $t0, 1
	j main
	
	main:
		#Imprimindo mensagem da venda
		li $v0, 4
		la $a0, msgvenda
		syscall
		#Lendo o valor da venda e guardando no registrador de ponto flutuante $f20
		li $v0, 6
		syscall
		mov.s $f20, $f0
	
		#Guardando os valores para cálculos em registradores de ponto flutuante
		lwc1 $f25, valor1 # $f25 = 1500.0
		lwc1 $f26, valor2 # $f26 = 0.10
		lwc1 $f27, valor3 # $f27 = 0.2
		lwc1 $f28, valor4 # $f28 = 1200.0
		
		c.le.s $f20, $f25 #Se valor venda($f20) for menor ou igual a 1500.0($f25)
		bc1t if
		bc1f else
		
	if: #Caso valor venda seja menor ou igual a 1500.0
		mul.s $f1, $f20, $f26 # $f1 = valor venda($f20)* 0.10($f26) 
		j main2
			
	else: #Caso valor venda seja maior que 1500.0
		# $f1 = (((valorvenda($f20) - 1500.0($f25) ) * 0.2($f27) ) + (0.10($f26) * valorvenda($f20) ))
		sub.s $f10, $f20, $f25
		mul.s $f10, $f10, $f27
		mul.s $f11, $f26, $f20
		add.s $f1, $f10, $f11
		j main2
		
	main2:
		#Calculando o salário final
		# $f2 = comissão($f1) + salário fixo 1200.0($f28)
		add.s $f2, $f1, $f28
		#Imprimindo mensagem da venda
		li $v0, 4
		la $a0, msgsalariofinal
		syscall
		#Imprimindo o salário já com a comissão somada
		li $v0, 2
		mov.s $f12, $f2
		syscall
		#Imprimindo mensagem para o usuário escolher se quer continuar ou não no programa
		li $v0, 4
		la $a0, msgfinalizar
		syscall
		#Lendo o inteiro digitado e guardando no registrados de ponto fixo $t1
		li $v0, 5
		syscall
		move $t1, $v0
		#Imprimindo mensagem para pular linha
		li $v0, 4
		la $a0, msgpular
		syscall
		#Condicionais para averiguar se o usuário deseja continuar ou não no programa
		beq $t1, $t0, main #Se ele deseja continuar, pular para main
		bne $t1, $t0, end #Se ele não deseja continuar, pular para end
		
	#Label para terminar o programa
	end:
		li $v0, 10
		syscall