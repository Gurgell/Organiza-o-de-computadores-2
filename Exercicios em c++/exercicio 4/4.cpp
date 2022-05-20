//Aluno: Gabriel Gurgel Gon�alves
//Prof: Lahir
//Organiza��o de computadores 2

#include <iostream>
#include <stdlib.h>
#include <locale.h>
using namespace std;

int main()
{
	//Deixando o programa em portugu�s
	setlocale(LC_ALL,"Portuguese");
	
	float salbruto, fx1, fx2, fx3, fx4, fx5, imp;
	
	cout << "Digite seu sal�rio bruto para que seja calculada a sua contribui��o mensal ao IRPF: ";
	cin >> salbruto;
	cout << endl << endl;
	
	//atribuindo teto das faixas para suas respectivas vari�veis somando-as.
	fx1 = 1903.98;
	fx2 = 2826.65;
	fx3 = 3751.05;
	fx4 = 4664.68;
	fx5 = salbruto - fx4;
	
	//Estruturas condicionais para direcionar corretamente conforme o sal�rio bruto e o teto das faixas
	if (salbruto <= fx1)
	{
		cout << "Faixas da base de c�lculo | Al�quota | Valor do imposto\n";
		cout << "1� faixa:    " << fx1 << "      | Isento" << "   | 00,00 \n\n";
		cout << "Voc� est� isento de imposto!\n";
		cout << "Seu sal�rio ser� de: R$ " << salbruto;
	}
	else if ((salbruto > fx1)&&(salbruto <= fx2))
	{
		cout << "Faixas da base de c�lculo | Al�quota | Valor do imposto\n";
		cout << "1� faixa:    " << fx1 << "      | Isento" << "   | 00,00 \n";
		cout << "2� faixa:    " << fx2 << "      | 7,5%  " << "   | 69,20 \n\n";
		cout << "Voc� dever� pagar um imposto de: R$ 69,20!\n";
		cout << "Seu sal�rio ser� de: R$ " << salbruto - 69.20;
	}
	else if ((salbruto > fx2)&&(salbruto <= fx3))
	{
		cout << "Faixas da base de c�lculo | Al�quota | Valor do imposto\n";
		cout << "1� faixa:    " << fx1 << "      | Isento" << "   | 00,00 \n";
		cout << "2� faixa:    " << fx2 << "      | 7,5%  " << "   | 69,20 \n";
		cout << "3� faixa:    " << fx3 << "      | 15%   " << "   | 138,66 \n\n";
		cout << "Voc� dever� pagar um imposto de: R$ 207,88!\n";
		cout << "Seu sal�rio ser� de: R$ " << salbruto - 207.88;
	}
	else if ((salbruto > fx3)&&(salbruto <= fx4))
	{
		cout << "Faixas da base de c�lculo | Al�quota | Valor do imposto\n";
		cout << "1� faixa:    " << fx1 << "      | Isento" << "   | 00,00 \n";
		cout << "2� faixa:    " << fx2 << "      | 7,5%  " << "   | 69,20 \n";
		cout << "3� faixa:    " << fx3 << "      | 15%   " << "   | 138,66 \n";
		cout << "4� faixa:    " << fx4 << "      | 22,5% " << "   | 205,57 \n\n";
		cout << "Voc� dever� pagar um imposto de: R$ 346,56!\n";
		cout << "Seu sal�rio ser� de: R$ " << salbruto - 346.56;
	}
	else
	{
		imp = 27.5 * fx5 / 100;
		
		cout << "Faixas da base de c�lculo | Al�quota | Valor do imposto\n";
		cout << "1� faixa:    " << fx1 << "      | Isento" << "   | 00,00 \n";
		cout << "2� faixa:    " << fx2 << "      | 7,5%  " << "   | 69,20 \n";
		cout << "3� faixa:    " << fx3 << "      | 15%   " << "   | 138,66 \n";
		cout << "4� faixa:    " << fx4 << "      | 22,5% " << "   | 205,57 \n";
		cout << "5� faixa:    " << fx5 << "      | 27,5% " << "   | " << imp << "\n\n";
		
		imp = imp + 413.4264;
		
		cout << "Voc� dever� pagar um imposto de: R$ " << imp << "\n";
		cout << "Seu sal�rio ser� de: R$ " << salbruto - imp;
	}
	
	return 0;
}
