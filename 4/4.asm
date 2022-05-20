.data
	msg: .asciiz "Digite seu salário bruto para que seja calculada a sua contribuição mensal ao IRPF: "
	msgcabeçalho: .asciiz "\nFaixas da base de cálculo   | Alíquota | Valor do imposto\n"
	
	#Atribuindo valores fixos para as faixas
	faixa1: .float 1903.98
	faixa2: .float 2826.65
	faixa3: .float 3751.05
	faixa4: .float 4664.68
	
	#Atribuindo valores fixos dos impostos
	impfx2: .float 69.20
	impfx3: .float 207.88
	impfx4: .float 346.56
	#Valores impostos faixa 5
	div100fx5: .float 100.0
	impfx5: .float 413.4264
	percentfx5: .float 27.5
	
	msgsalario: .asciiz "\nSeu salário será de: R$ "
	#Mensagem faixa 1
	msgfx1: .asciiz "1° faixa:    1903.98        | Isento   | 00,00"
	msgisento: .asciiz "\n\nVocê está isento de imposto!\n"
	#Mensagem faixa 2
	msgfx2: .asciiz "\n2° faixa     2826.65        | 7,5%     | 69,20 "
	msgimpfx2: .asciiz "\n\nVocê deverá pagar um imposto de: R$ 69,20!"
	#Mensagem faixa 3
	msgfx3: .asciiz "\n3° faixa:    3751.05        | 15%      | 138,66 "
	msgimpfx3: .asciiz "\n\nVocê deverá pagar um imposto de: R$ 207,88!"
	#Mensagem faixa 4
	msgfx4: .asciiz "\n4° faixa:    4664.68        | 22,5%    | 205,57 "
	msgimpfx4: .asciiz "\n\nVocê deverá pagar um imposto de: R$ 346,56!"
	#Mensagem faixa 5
	msgfx5: .asciiz "\n5° faixa:    "
	msgfx5.2: .asciiz "       | 27,5%    | "
	msgimpfx5: .asciiz "\n\nVocê deverá pagar um imposto de: R$ "
.text
	#Imprimindo para que o usuário digite o salário bruto
	li $v0, 4
	la $a0, msg
	syscall
	#Pegando o salário bruto e guardando em $f1
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	#Guardando os valores das faixas em registradores de ponto flutuante
	lwc1 $f20, faixa1 #1903.98
	lwc1 $f21, faixa2 #2826.65
	lwc1 $f22, faixa3 #3751.05
	lwc1 $f23, faixa4 #4664.68
	
	#Guardando os valores dos impostos de cada faixa em registradores de ponto flutuante
	lwc1 $f25, impfx2 #69.20
	lwc1 $f26, impfx3 #207.88
	lwc1 $f27, impfx4 #346.56
	
	#A faixa 5 é o resultado entre a subtração do salário bruto ($f1) menos a faixa 4 ($f23)
	sub.s $f24, $f1, $f23
	
	#Guardando os valores dos calculos do imposto da faixa 5 em registradores de ponto flutuante
	lwc1 $f28, percentfx5 #27.5
	lwc1 $f29, impfx5 #413.4264
	lwc1 $f30, div100fx5 #100.0
	
	c.le.s $f1, $f20 #Se o salário bruto for menor ou igual a faixa 1 (1903.98)
	bc1t if
	bc1f else
	
	if: #caso o salário bruto seja menor ou igual a faixa 1 (1903.98)
		#Imprimindo cabeçalho das faixas
		li $v0, 4
		la $a0, msgcabeçalho
		syscall
		#Imprimindo a primeira faixa
		li $v0, 4
		la $a0, msgfx1
		syscall
		#Imprimindo a parte do imposto
		li $v0, 4
		la $a0, msgisento
		syscall
		#Imprimindo o aviso que irá mostrar o salário
		li $v0, 4
		la $a0, msgsalario
		syscall
		#Imprimindo novo salário já com o imposto cobrado
		li $v0, 2
		mov.s $f12, $f1
		syscall
		
		j end
		
	else: #Caso seja maior que a faixa 1 (1903.98)
		c.le.s $f1, $f21 #Se o salário bruto for menor ou igual a faixa 2 (2826.65)
		bc1t if1
		bc1f else1
	
	if1: #caso o salário bruto seja menor ou igual que a faixa 2 (2826.65)
		#Imprimindo cabeçalho das faixas
		li $v0, 4
		la $a0, msgcabeçalho
		syscall
		#Imprimindo a primeira faixa
		li $v0, 4
		la $a0, msgfx1
		syscall
		#Imprimindo a segunda faixa
		li $v0, 4
		la $a0, msgfx2
		syscall
		#Imprimindo o imposto a ser pago
		li $v0, 4
		la $a0, msgimpfx2
		syscall
		#Diminuindo o salário bruto do imposto para obter o novo salário
		sub.s $f2, $f1, $f25
		#Imprimindo o aviso que irá mostrar o novo salário
		li $v0, 4
		la $a0, msgsalario
		syscall
		#Imprimindo novo salário já com o imposto cobrado
		li $v0, 2
		mov.s $f12, $f2
		syscall
		
		j end
		
	else1: #Caso seja maior que a faixa 2 (2826.65)
		c.le.s $f1, $f22 #Se o salário bruto for menor ou igual a faixa 3 (3751.05)
		bc1t if2
		bc1f else2
		
	if2: #caso o salário bruto seja menor ou igual que a faixa 3 (3751.05)
		#Imprimindo cabeçalho das faixas
		li $v0, 4
		la $a0, msgcabeçalho
		syscall
		#Imprimindo a primeira faixa
		li $v0, 4
		la $a0, msgfx1
		syscall
		#Imprimindo a segunda faixa
		li $v0, 4
		la $a0, msgfx2
		syscall
		#Imprimindo a terceira faixa
		li $v0, 4
		la $a0, msgfx3
		syscall
		#Imprimindo o imposto a ser pago
		li $v0, 4
		la $a0, msgimpfx3
		syscall
		#Diminuindo o salário bruto do imposto para obter o novo salário
		sub.s $f2, $f1, $f26
		#Imprimindo o aviso que irá mostrar o novo salário
		li $v0, 4
		la $a0, msgsalario
		syscall
		#Imprimindo novo salário já com o imposto cobrado
		li $v0, 2
		mov.s $f12, $f2
		syscall
		
		j end
		
	else2: #Caso seja maior que a faixa 3 (3751.05)
		c.le.s $f1, $f23 #Se o salário bruto for menor ou igual a faixa 4 (4664.68)
		bc1t if3
		bc1f else3
	
	if3: #caso o salário bruto seja menor ou igual que a faixa 4 (4664.68)
		#Imprimindo cabeçalho das faixas
		li $v0, 4
		la $a0, msgcabeçalho
		syscall
		#Imprimindo a primeira faixa
		li $v0, 4
		la $a0, msgfx1
		syscall
		#Imprimindo a segunda faixa
		li $v0, 4
		la $a0, msgfx2
		syscall
		#Imprimindo a terceira faixa
		li $v0, 4
		la $a0, msgfx3
		syscall
		#Imprimindo a quarta faixa
		li $v0, 4
		la $a0, msgfx4
		syscall
		#Imprimindo o imposto a ser pago
		li $v0, 4
		la $a0, msgimpfx4
		syscall
		#Diminuindo o salário bruto do imposto para obter o novo salário
		sub.s $f2, $f1, $f27
		#Imprimindo o aviso que irá mostrar o novo salário
		li $v0, 4
		la $a0, msgsalario
		syscall
		#Imprimindo novo salário já com o imposto cobrado
		li $v0, 2
		mov.s $f12, $f2
		syscall
		
		j end

	else3: #Caso seja maior que a faixa 4 (4664.68)
		#Calculando o imposto da faixa 5
		mul.s $f28, $f28, $f24
		div.s $f28, $f28, $f30
		#Imprimindo cabeçalho das faixas
		li $v0, 4
		la $a0, msgcabeçalho
		syscall
		#Imprimindo a primeira faixa
		li $v0, 4
		la $a0, msgfx1
		syscall
		#Imprimindo a segunda faixa
		li $v0, 4
		la $a0, msgfx2
		syscall
		#Imprimindo a terceira faixa
		li $v0, 4
		la $a0, msgfx3
		syscall
		#Imprimindo a quarta faixa
		li $v0, 4
		la $a0, msgfx4
		syscall
		#Imprimindo a quinta faixa
		li $v0, 4
		la $a0, msgfx5
		syscall
		#Imprimindo valor da faixa 5
		li $v0, 2
		mov.s $f12, $f24
		syscall
		#Imprimindo a quinta faixa parte 2
		li $v0, 4
		la $a0, msgfx5.2
		syscall
		#Imprimindo o imposto da faixa 5
		li $v0, 2
		mov.s $f12, $f28
		syscall
		#Calculando o imposto a ser descontado
		add.s $f28, $f28, $f29
		#calculando o novo salário
		sub.s $f2, $f1, $f28
		#Imprimindo a mensagem do imposto
		li $v0, 4
		la $a0, msgimpfx5
		syscall
		#Imprimindo o imposto
		li $v0, 2
		mov.s $f12, $f28
		syscall
		#Imprimindo o aviso que irá mostrar o novo salário
		li $v0, 4
		la $a0, msgsalario
		syscall
		#Imprimindo novo salário já com o imposto cobrado
		li $v0, 2
		mov.s $f12, $f2
		syscall
		
		j end
		
	end: #label para terminar o programa
		li $v0, 10
		syscall
