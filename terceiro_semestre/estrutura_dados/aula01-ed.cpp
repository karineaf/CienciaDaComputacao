/Escreva uma função que calcule o salário líquido. A função deverá receber como parâmetro o salário bruto e o desconto percentual do INSS.

#include <stdio.h>
#include <stdlib.h>

float salLiquido(float salBruto, float percentINSS){ 
salBruto -= (salBruto*percentINSS)/100;
return salBruto;
}


int main (){
float salBruto, percentINSS;
printf ("Digite seu salario bruto: ");
scanf ("%f",&salBruto);
printf ("Digite o percentual de desconto do INSS: ");
scanf ("%f",&percentINSS);
printf ("O valor do seu salário líquido é R$ %4.2f", salLiquido(salBruto, percentINSS) );
system("PAUSE");
return 0;
}

_____________________________________________________________
_____________________________________________________________
