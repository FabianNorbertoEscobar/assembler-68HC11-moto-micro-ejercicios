/*
ARQUITECTURA DE COMPUTADORAS

TRABAJO PRÁCTICO 6: UNIDAD CENTRAL DE PROCESO
PROGRAMACIÓN EN LENGUAJE SIMBÓLICO - PROGRAMACIÓN AVANZADA

INTRODUCCIÓN AL PROBLEMA
Una variable es una posición de memoria que puede ser leída y escrita. Desde un lenguaje de alto nivel se le indica al compilador
el tipo de dato al que pertenece una variable. El tipo de dato indica el tamaño a reservar, es decir, la cantidad de bits que debe ocupar
la variable y cómo se decodificará el patrón de bits hallado en esa posición de memoria. La misma palabra binaria tiene significado diferente
dependiendo del tipo de dato de la variable. Para la electrónica son solo señales representadas por ceros y unos, es el programador
el que asigna un sentido especial a cada palabra de ceros y unos.

OBJETIVOS
Relacionar el concepto de tipo de dato en alto nivel con bajo nivel. Evidenciar los efectos de intentar sobrepasar la capacidad en bits
de una variable declarada de un tipo. Afirmar el concepto de overflow en la representación interna de números enteros y caracteres.

ENUNCIADOS
Dado el programa en C++ que se adjunta, realizar su equivalente en lenguaje simbólico y lenguaje de máquina del HC11(operaciones y asignaciones,
no entradas y salidas). Observar las salidas de C++ y que los únicos mensajes del compilador se refieren al warning
“Conversion may lose significant digits”. Explicar y mostrar la razón de las salidas obtenidas.
*/

#include <iostream>
#include <conio.h>
#include <cmath>

using namespace std;

//Ejemplos de overflow

int main()
{
    short i ;
    int ii ;
    long l ;
    float f ;
    char c ;
    cout << "Presionar cualquier tecla para avanzar" << endl ;
    getch() ;
    i = 32767 ;
    i++ ;
    cout << endl << "32767 + 1 como short da " << i << endl ;
    getch() ;
    ii = 32767 ;
    ii++ ;
    cout << endl << "32767 + 1 como int da " << ii << endl ;
    getch() ;
    ii = pow(2,31) ;
    ii++ ;
    cout << endl << "2^31 como int da " << ii << endl ;
    getch() ;
    l = pow(2,31) ;
    l++ ;
    cout << endl << "2^31 como long da " << l << endl ;
    getch() ;
    i = -32768 ;
    i-- ;
    cout << endl << "-32768 - 1 como short da " << i << endl ;
    getch() ;
    i = 45000 ;
    cout << endl << "i = 45000 como short da " << i << endl ;
    getch() ;
    i = 32000 + 25000 ;
    f = i ;
    cout << endl << "32000 + 25000 como entero ==> " << i << endl ;
    cout << endl << "32000 + 25000 como real ==> " << f << endl ;
    getch() ;
    f = 32000 + 25000 ;
    i = f ;
    cout << endl << "32000 + 25000 como entero ==> " << i << endl ;
    cout << endl << "32000 + 25000 como real ==> " << f << endl ;
    getch() ;
    c = 'A' ;
    cout << endl << "la A como char da " << c << endl ;
    getch() ;
    c = 65 ;
    cout << endl << "c = 65 como char da " << c << endl ;
    c = 321;
    cout << endl << "c = 321 como char da " << c << endl ;
    c = -191 ;
    cout << endl << "c = -191 como char da " << c << endl ;
    c = 128 ;
    cout << endl << "c = 128 como char da " << c << endl ;
    c = -128 ;
    cout << endl << "c = -128 como char da " << c << endl ;
    cout << endl << "Tama" <<char(164) <<"o de short, int, long, float, char = "
         << sizeof(short) << ", "
         << sizeof(int) << ", "
         << sizeof(long) << ", "
         << sizeof(float) << ", "
         << sizeof(char) << " respectivamente " << endl ;
    cout << endl << "Presionar cualquier tecla para terminar" << endl ;
    getch() ;
    return 0;
}
