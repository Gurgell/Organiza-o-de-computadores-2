//Aluno: Gabriel Gurgel Gon�alves
//Prof: Lahir
//Organiza��o de computadores 2

#include <iostream>
#include <stdlib.h>
#include <locale.h>
using namespace std;

int main()
{
	setlocale(LC_ALL,"Portuguese");
	
	float sal, percentaliquo, valorimp, novosal;
	
	cout << "Digite seu sal�rio bruto para que seja calculada a sua contribui��o mensal ao INSS: ";
	cin >> sal;
	
	if (sal <= 1212)
	{
		percentaliquo = 7.5 * sal / 100;
		valorimp = percentaliquo;
		novosal = sal - valorimp;
		cout << "Sal�rio bruto:                         " << "R$ " << sal << "\n";
		cout << "Al�quota:                              " << "7.5%\n";
		cout << "Valor a ser descontado:                " << "R$ " << valorimp << "\n";
		cout << "Valor do sal�rio ap�s aplicar imposto: " << "R$ " << novosal << "\n";
	}
	else if ((sal > 1212)&&(sal <= 2427.35))
	{
		percentaliquo = 9 * sal / 100;
		valorimp = percentaliquo - 18.18;
		novosal = sal - valorimp;
		cout << "Sal�rio bruto:                         " << "R$ " << sal << "\n";
		cout << "Al�quota:                              " << "9%\n";
		cout << "Valor a ser descontado:                " << "R$ " << valorimp << "\n";
		cout << "Valor do sal�rio ap�s aplicar imposto: " << "R$ " << novosal << "\n";
	}
	else if ((sal > 2427.35)&&(sal <= 3641.03))
	{
		percentaliquo = 12 * sal / 100;
		valorimp = percentaliquo - 91.01;
		novosal = sal - valorimp;
		cout << "Sal�rio bruto:                         " << "R$ " << sal << "\n";
		cout << "Al�quota:                              " << "12%\n";
		cout << "Valor a ser descontado:                " << "R$ " << valorimp << "\n";
		cout << "Valor do sal�rio ap�s aplicar imposto: " << "R$ " << novosal << "\n";
	}
	else if ((sal > 3641.03)&&(sal <= 7087.22))
	{
		percentaliquo = 14 * sal / 100;
		valorimp = percentaliquo - 163;
		novosal = sal - valorimp;
		cout << "Sal�rio bruto:                         " << "R$ " << sal << "\n";
		cout << "Al�quota:                              " << "14%\n";
		cout << "Valor a ser descontado:                " << "R$ " << valorimp << "\n";
		cout << "Valor do sal�rio ap�s aplicar imposto: " << "R$ " << novosal << "\n";
	}
	else
	{
		cout << "\nSal�rio acima do teto, portanto o desconto ser� aplicado tendo em base o teto (R$ 7087.22)!\n\n";
		percentaliquo = 14 * 7087.22 / 100;
		valorimp = percentaliquo - 163;
		novosal = sal - valorimp;
		cout << "Sal�rio bruto:                         " << "R$ " << sal << "\n";
		cout << "Al�quota:                              " << "14%\n";
		cout << "Valor a ser descontado:                " << "R$ " << valorimp << "\n";
		cout << "Valor do sal�rio ap�s aplicar imposto: " << "R$ " << novosal << "\n";
	}
}
