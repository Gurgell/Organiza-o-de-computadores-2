//Aluno: Gabriel Gurgel Gonçalves
//Prof: Lahir
//Organização de computadores 2

#include <iostream>
#include <stdlib.h>
#include <locale.h>
using namespace std;

int main()
{
	setlocale(LC_ALL,"Portuguese");
	
	float sal, percentaliquo, valorimp, novosal;
	
	cout << "Digite seu salário bruto para que seja calculada a sua contribuição mensal ao INSS: ";
	cin >> sal;
	
	if (sal <= 1212)
	{
		percentaliquo = 7.5 * sal / 100;
		valorimp = percentaliquo;
		novosal = sal - valorimp;
		cout << "Salário bruto:                         " << "R$ " << sal << "\n";
		cout << "Alíquota:                              " << "7.5%\n";
		cout << "Valor a ser descontado:                " << "R$ " << valorimp << "\n";
		cout << "Valor do salário após aplicar imposto: " << "R$ " << novosal << "\n";
	}
	else if ((sal > 1212)&&(sal <= 2427.35))
	{
		percentaliquo = 9 * sal / 100;
		valorimp = percentaliquo - 18.18;
		novosal = sal - valorimp;
		cout << "Salário bruto:                         " << "R$ " << sal << "\n";
		cout << "Alíquota:                              " << "9%\n";
		cout << "Valor a ser descontado:                " << "R$ " << valorimp << "\n";
		cout << "Valor do salário após aplicar imposto: " << "R$ " << novosal << "\n";
	}
	else if ((sal > 2427.35)&&(sal <= 3641.03))
	{
		percentaliquo = 12 * sal / 100;
		valorimp = percentaliquo - 91.01;
		novosal = sal - valorimp;
		cout << "Salário bruto:                         " << "R$ " << sal << "\n";
		cout << "Alíquota:                              " << "12%\n";
		cout << "Valor a ser descontado:                " << "R$ " << valorimp << "\n";
		cout << "Valor do salário após aplicar imposto: " << "R$ " << novosal << "\n";
	}
	else if ((sal > 3641.03)&&(sal <= 7087.22))
	{
		percentaliquo = 14 * sal / 100;
		valorimp = percentaliquo - 163;
		novosal = sal - valorimp;
		cout << "Salário bruto:                         " << "R$ " << sal << "\n";
		cout << "Alíquota:                              " << "14%\n";
		cout << "Valor a ser descontado:                " << "R$ " << valorimp << "\n";
		cout << "Valor do salário após aplicar imposto: " << "R$ " << novosal << "\n";
	}
	else
	{
		cout << "\nSalário acima do teto, portanto o desconto será aplicado tendo em base o teto (R$ 7087.22)!\n\n";
		percentaliquo = 14 * 7087.22 / 100;
		valorimp = percentaliquo - 163;
		novosal = sal - valorimp;
		cout << "Salário bruto:                         " << "R$ " << sal << "\n";
		cout << "Alíquota:                              " << "14%\n";
		cout << "Valor a ser descontado:                " << "R$ " << valorimp << "\n";
		cout << "Valor do salário após aplicar imposto: " << "R$ " << novosal << "\n";
	}
}
