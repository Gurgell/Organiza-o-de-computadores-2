.data
	msg: .asciiz "Digite seu sal�rio bruto para que seja calculada a sua contribui��o mensal ao INSS: "
	msg1: .asciiz "\nSal�rio:                               R$ "
	msg2: .asciiz "\nValor a ser descontado:                R$ "
	msg3: .asciiz "\nValor do sal�rio ap�s aplicar imposto: R$ "
	msgali: .asciiz "\nAl�quota:                              7.5%"
	msgali2: .asciiz "\nAl�quota:                              9.0%"
	msgali3: .asciiz "\nAl�quota:                              12.0%"
	msgali4: .asciiz "\nAl�quota:                              14.0%"
	msgacima: .asciiz "\nSal�rio acima do teto, portanto o desconto ser� aplicado tendo em base o teto (R$ 7087.22)!"
	
	#Valores para as condicionais
	valor1: .float 1212.0
	valor2: .float 2427.35
	valor3: .float 3641.03
	valor4: .float 7087.0
	
	#Valores para porcentagem da al�quota
	percentali1: .float 7.5
	percentali2: .float 9.0
	percentali3: .float 12.0
	percentali4: .float 14.0
	div100: .float 100.0
	
	#Valores para calculo novo sal�rio
	valor5: .float 18.18
	valor6: .float 91.01
	valor7: .float 163.0
.text
	#Intru��o para imprimir a pedida do sal�rio bruto
	li $v0, 4
	la $a0, msg
	syscall
	#Guardando o sal�rio bruto em $f1
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	#Atribuindo valores para usar nas condicionais nos registradores de ponto flutuante
	lwc1 $f20, valor1 #1212
	lwc1 $f21, valor2 #2427.35
	lwc1 $f22, valor3 #3641.03
	lwc1 $f23, valor4 #7087.22
	
	#Atribuindo valores para calcular as porcentagens das al�quotas nos registradores de ponto flutuante
	lwc1 $f24, percentali1 #7.5
	lwc1 $f25, percentali2 #9.0
	lwc1 $f26, percentali3 #12.0
	lwc1 $f27, percentali4 #14.0
	lwc1 $f28, div100 #100.0
	
	#Atribuindo valores para calcular novo sal�rio nos registradores de ponto flutuante
	lwc1 $f29, valor5 #18.18
	lwc1 $f30, valor6 #91.01
	lwc1 $f31, valor7 #163.0
	
	c.le.s $f1, $f20 #Sal�rio bruto <= 1212
	bc1t if 
	bc1f else 
	
	if: #Caso sal�rio bruto seja menor ou igual a 1212
		mul.s $f2, $f1, $f24 # $f2 = $f1(sal�rio bruto) * $f24 (7.5)
		div.s $f2, $f2, $f28 # $f2 = $f2(resultado multiplica��o acima) / $f28 (100)
		sub.s $f3, $f1, $f2 # Novo sal�rio com o imposto aplicado ($f3)
		#Imprimindo mensagem de sal�rio bruto na tela
		li $v0, 4
		la $a0, msg1
		syscall
		#Imprimindo sal�rio bruto na tela
		li $v0, 2
		mov.s $f12, $f1
		syscall
		#Imprimindo mensagem da al�quota na tela
		li $v0, 4
		la $a0, msgali
		syscall
		#Imprimindo mensagem de valor a ser descontado
		li $v0, 4
		la $a0, msg2
		syscall
		#Imprimindo valor a ser descontado
		li $v0, 2
		mov.s $f12, $f2
		syscall
		#Imprimindo mensagem do valor do novo sal�rio
		li $v0, 4
		la $a0, msg3
		syscall
		#Imprimindo novo sal�rio
		li $v0, 2
		mov.s $f12, $f3
		syscall
		
		#Salto para terminar o programa
		j end
		
	else: #Caso seja maior que 1212
		c.le.s $f1, $f21 #Sal�rio bruto <= 2427.35
		bc1t if1 
		bc1f else1
		
	if1: #Caso sal�rio bruto seja menor ou igual a 2427.35
		mul.s $f2, $f1, $f25 # $f2 = $f1(sal�rio bruto) * $f25 (9.0)
		div.s $f2, $f2, $f28 # $f2 = $f2(resultado multiplica��o acima) / $f28 (100)
		sub.s $f2, $f2, $f29 # Calculo para o imposto
		sub.s $f3, $f1, $f2 # Novo sal�rio com o imposto aplicado ($f3)
		#Imprimindo mensagem de sal�rio bruto na tela
		li $v0, 4
		la $a0, msg1
		syscall
		#Imprimindo sal�rio bruto na tela
		li $v0, 2
		mov.s $f12, $f1
		syscall
		#Imprimindo mensagem da al�quota na tela
		li $v0, 4
		la $a0, msgali2
		syscall
		#Imprimindo mensagem de valor a ser descontado
		li $v0, 4
		la $a0, msg2
		syscall
		#Imprimindo valor a ser descontado
		li $v0, 2
		mov.s $f12, $f2
		syscall
		#Imprimindo mensagem do valor do novo sal�rio
		li $v0, 4
		la $a0, msg3
		syscall
		#Imprimindo novo sal�rio
		li $v0, 2
		mov.s $f12, $f3
		syscall
		
		#Salto para terminar o programa
		j end	
		
	else1: #Caso seja maior que 2427.35
		c.le.s $f1, $f22 #Sal�rio bruto <= 3641.03
		bc1t if2 
		bc1f else2
		
	if2: #Caso salario bruto seja menor ou igual a 3641.03
		mul.s $f2, $f1, $f26 # $f2 = $f1(sal�rio bruto) * $f26 (12.0)
		div.s $f2, $f2, $f28 # $f2 = $f2(resultado multiplica��o acima) / $f28 (100)
		sub.s $f2, $f2, $f30 # Calculo para o imposto
		sub.s $f3, $f1, $f2 # Novo sal�rio com o imposto aplicado ($f3)
		#Imprimindo mensagem de sal�rio bruto na tela
		li $v0, 4
		la $a0, msg1
		syscall
		#Imprimindo sal�rio bruto na tela
		li $v0, 2
		mov.s $f12, $f1
		syscall
		#Imprimindo mensagem da al�quota na tela
		li $v0, 4
		la $a0, msgali3
		syscall
		#Imprimindo mensagem de valor a ser descontado
		li $v0, 4
		la $a0, msg2
		syscall
		#Imprimindo valor a ser descontado
		li $v0, 2
		mov.s $f12, $f2
		syscall
		#Imprimindo mensagem do valor do novo sal�rio
		li $v0, 4
		la $a0, msg3
		syscall
		#Imprimindo novo sal�rio
		li $v0, 2
		mov.s $f12, $f3
		syscall
		
		#Salto para terminar o programa
		j end
		
	else2: #Caso seja maior que 3641.03
		c.le.s $f1, $f23 #Sal�rio bruto <= 7087.22
		bc1t if3
		bc1f else3
		
	if3: #Caso salario bruto seja menor ou igual a 7087.22
		mul.s $f2, $f1, $f27 # $f2 = $f1(sal�rio bruto) * $f27 (14.0)
		div.s $f2, $f2, $f28 # $f2 = $f2(resultado multiplica��o acima) / $f28 (100)
		sub.s $f2, $f2, $f31 # Calculo para o imposto
		sub.s $f3, $f1, $f2 # Novo sal�rio com o imposto aplicado ($f3)
		#Imprimindo mensagem de sal�rio bruto na tela
		li $v0, 4
		la $a0, msg1
		syscall
		#Imprimindo sal�rio bruto na tela
		li $v0, 2
		mov.s $f12, $f1
		syscall
		#Imprimindo mensagem da al�quota na tela
		li $v0, 4
		la $a0, msgali4
		syscall
		#Imprimindo mensagem de valor a ser descontado
		li $v0, 4
		la $a0, msg2
		syscall
		#Imprimindo valor a ser descontado
		li $v0, 2
		mov.s $f12, $f2
		syscall
		#Imprimindo mensagem do valor do novo sal�rio
		li $v0, 4
		la $a0, msg3
		syscall
		#Imprimindo novo sal�rio
		li $v0, 2
		mov.s $f12, $f3
		syscall
		
		#Salto para terminar o programa
		j end
		
	else3: #Caso seja maior que 7087.22
		mul.s $f2, $f23, $f27 # $f2 = 7087.22(Sal�rio teto) * $f27 (14.0)
		div.s $f2, $f2, $f28 # $f2 = $f2(resultado multiplica��o acima) / $f28 (100)
		sub.s $f2, $f2, $f31 # Calculo para o imposto
		sub.s $f3, $f1, $f2 # Novo sal�rio com o imposto aplicado ($f3)
		#Imprimindo mensagem de sal�rio acima do teto
		li $v0, 4
		la $a0, msgacima
		syscall
		#Imprimindo mensagem de sal�rio bruto na tela
		li $v0, 4
		la $a0, msg1
		syscall
		#Imprimindo sal�rio bruto na tela
		li $v0, 2
		mov.s $f12, $f1
		syscall
		#Imprimindo mensagem da al�quota na tela
		li $v0, 4
		la $a0, msgali4
		syscall
		#Imprimindo mensagem de valor a ser descontado
		li $v0, 4
		la $a0, msg2
		syscall
		#Imprimindo valor a ser descontado
		li $v0, 2
		mov.s $f12, $f2
		syscall
		#Imprimindo mensagem do valor do novo sal�rio
		li $v0, 4
		la $a0, msg3
		syscall
		#Imprimindo novo sal�rio
		li $v0, 2
		mov.s $f12, $f3
		syscall
		
		#Salto para terminar o programa
		j end
	
	#Label para terminar o programa
	end:
		li $v0, 10
		syscall