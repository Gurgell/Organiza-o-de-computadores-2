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
	
	int nquarto;
	
	cout << "Informe o n�mero do quarto: ";
	cin >> nquarto;
	
	if (nquarto % 2 == 0) 
		cout << "Caminho � direita!";
	else 
		cout << "Caminho � esquerda!";
}
