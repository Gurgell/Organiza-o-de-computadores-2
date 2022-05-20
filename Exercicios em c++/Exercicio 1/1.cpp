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
	
	float peso, altura, imc;
	cout << "Digite o seu peso em kg: ";
	cin >> peso;
	cout << "Digite a sua altura em metros: ";
	cin >> altura;
	
	imc = peso / (altura * altura);
	
	if (imc < 16){
	    cout << "IMC: " << imc << " - Magreza grave!";
    }
	else if ((imc >= 16)&&(imc < 17)){
		cout << "IMC: " << imc << " - Magreza moderada!";
	}  
	else if ((imc >= 17)&&(imc < 18.5)){
		cout << "IMC: " << imc << " - Magreza leve!";
	}  
	else if ((imc >= 18.5)&&(imc < 25)){
		cout << "IMC: " << imc << " - Saudável!";
	}  
	else if ((imc >= 25)&&(imc < 30)){
		cout << "IMC: " << imc << " - Sobrepeso!";
	}  
	else if ((imc >= 30)&&(imc < 35)){
		cout << "IMC: " << imc << " - Obesidade grau 1!";
	}  
	else if ((imc >= 35)&&(imc < 40)){
		cout << "IMC: " << imc << " - Obesidade grau 2!(Severa)";
	} 
	else
	{
		cout << "IMC: " << imc << " - Obesidade grau 3!(Mórbida)";
    } 	
	return 0;
}
