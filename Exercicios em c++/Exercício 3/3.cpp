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
	
	int nquarto;
	
	cout << "Informe o número do quarto: ";
	cin >> nquarto;
	
	if (nquarto % 2 == 0) 
		cout << "Caminho à direita!";
	else 
		cout << "Caminho à esquerda!";
}
