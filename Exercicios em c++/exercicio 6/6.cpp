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
	
	float valorvenda, comissao;
	int op(0);
	
	//Estrutura de repetição para que o usuário decida quando terminar o programa
	do
	{
		//Recebendo valor da venda
		cout << "Digite o valor da sua venda: ";
		cin >> valorvenda;
	
		//Condicional para saber o valor da comissão
		if (valorvenda <= 1500)
			comissao = valorvenda * 0.10;
		else
			comissao = (((valorvenda-1500) * 0.2) + (0.10 * valorvenda));
	
		cout << "O seu salário fixo + comissão foi de: R$ " << comissao + 1200 << "\n\n";
		
		
		cout << "Digite 1 para finalizar o programa e qualquer outra tecla para continuar: ";
		cin >> op;
		cout << endl << endl;
	}while(op != 1);
}
