* sumatoria en 16 bits de un vector de elementos de 8 bits

	ORG	0000
dirIni	RMB	2	direccion inicial del vector
cant	RMB	1	cantidad de elementos que tiene el vector
suma	RMB	2	suma en 16 bits

	ORG	$C000
	CLR	suma	limpio la parte alta del resultado de la suma
	CLR 	suma+1	limpio la parte baja del resultado de la suma
	LDX	dirIni	cargo en el reg indice X la direccion de inicio del vector

bucle	CLRA		limpio la parte alta del registro D
	LDAB	0,x	cargo en la parte baja del registro D el contenido de la dir del indX
	ADDD	suma	le sumo al registro D lo que contiene suma
	STD	suma	almaceno la nueva suma que contiene el regD en los bytes de la suma
	INX		incremento la direccion del registro indice x
	DEC	cant	decremento la cantidad de elementos que falta sumar
	BNE	bucle	si la cantidad no llega a cero, vuelvo a ejecutar el bucle
fin	BRA	fin