* ordenar de menor a mayor un vector de numero no signados de 8 bits
* se conoce la direccion inicial del vector y la cantidad de elementos

	ORG	0000
dirIni	RMB	2	direccion de inicio del vector
cant	RMB	1	cantidad de elementos del vector
dirFin	RMB	2	direccion de fin del vector <--- la calculo yo

	ORG	$C000
	LDD	dirIni	cargo la direccion de inicio del vector en el regD
	ADDB	cant	le sumo la cantidad de elementos que tiene el vector
	STD	dirFin	almaceno el resultado --> direccion de fin del vector
	LDY	dirIni	cargo la direccion de inicio en el indice Y

bucExt	LDX	dirIni	cargo la direccion de inicio en el indice X

bucInt	LDAA	0,x	cargo el contenido de la dir de ind x en acumA
	CMPA	1,x	lo comparo contra el siguiente del vector
	BLS	sig	si lo de acumA es menor o igual, salto al siguiente

	LDAB	1,x	si no, intercambio. Cargo el siguiente en acumB
	STAA	1,x	almaceno el anterior en la direccion del siguiente
	STAB	0,x	almaceno el siguiente en la direccion del anterior
	
sig	INX		incremento el indice X --> paso al siguiente
	CPX	dirFin	comparo al indX contra direccion de fin para no caerme
	BNE	bucInt	si no ZERO, vuelvo a ejecutar el bucle interno-> sig

	INY		incremento el indice Y --> el primero queda ordenado
	CPY	dirFin	comparo al indY contra direccion de fin para no caerme
	BNE	bucExt	si no ZERO, vuelvo a ejecutar el bucle externo->pasada

fin	BRA	fin