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
	
	float comprimento, altura, largura, areapiscina;
	float alturalad, comprimentolad, arealadrilho;
	
	//Recebendo dados e calculando a �rea da piscina em m�
	cout << "Digite o comprimento da piscina em metros: ";
	cin >> comprimento;
	cout << "Digite a altura da piscina em metros: ";
	cin >> altura;
	cout << "Digite a largura em metros: ";
	cin >> largura;
	
	areapiscina = ((2 * largura * altura) + (2 * comprimento * altura) + (largura * comprimento));

	//Recebendo dados e calculando a �rea do ladrilho em cm� e depois passando para m� ao dividir por 10000
	cout << endl << endl;
	cout << "Informe a altura do ladrilho em cent�metros: ";
	cin >> alturalad;
	cout << "Informe a comprimento do ladrilho em cent�metros: ";
	cin >> comprimentolad;
	 
	arealadrilho = (alturalad * comprimentolad) / 10000;
	
	cout << "\nA quantidade total de ladrilhos a serem comprados � de: " << areapiscina / arealadrilho;
	
	return 0;	
}
