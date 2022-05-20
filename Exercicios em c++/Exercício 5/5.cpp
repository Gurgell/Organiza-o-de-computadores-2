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
	
	float comprimento, altura, largura, areapiscina;
	float alturalad, comprimentolad, arealadrilho;
	
	//Recebendo dados e calculando a área da piscina em m²
	cout << "Digite o comprimento da piscina em metros: ";
	cin >> comprimento;
	cout << "Digite a altura da piscina em metros: ";
	cin >> altura;
	cout << "Digite a largura em metros: ";
	cin >> largura;
	
	areapiscina = ((2 * largura * altura) + (2 * comprimento * altura) + (largura * comprimento));

	//Recebendo dados e calculando a área do ladrilho em cm² e depois passando para m² ao dividir por 10000
	cout << endl << endl;
	cout << "Informe a altura do ladrilho em centímetros: ";
	cin >> alturalad;
	cout << "Informe a comprimento do ladrilho em centímetros: ";
	cin >> comprimentolad;
	 
	arealadrilho = (alturalad * comprimentolad) / 10000;
	
	cout << "\nA quantidade total de ladrilhos a serem comprados é de: " << areapiscina / arealadrilho;
	
	return 0;	
}
