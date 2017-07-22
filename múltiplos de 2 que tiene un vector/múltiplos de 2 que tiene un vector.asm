* contar multiplos de 2 que tiene un vector

	ORG	0000
dirIni	RMB	2	direccion de inicio del vector
dirFin	RMB	2	direccion de fin del vector
mult2	RMB	1	cantidad de multiplos de 2

	ORG	$C000	
	CLR	mult2	limpio el contador
	LDX	dirIni	cargo la direccion inicial del vector en el reg indice x
bucle	LDAA	0,x	cargo en acumA el contenido de la direccion del indice x
	ANDA	#01	si contenido de acumA es par, entonces AND da cero
	BNE	noEs	salto si esto no ocurre
	INC	mult2	cuento un multiplo
noEs	INX		incremento contenido del registro indice x
	CPX	dirFin	comparo con la direccion final para no caermne del vector
	BLO	bucle	si no termine, vuelvo a ejecutar el bucle
fin	BRA	fin	