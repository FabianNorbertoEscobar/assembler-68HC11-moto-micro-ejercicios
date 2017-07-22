* contar multiplos de 4 que tiene un vector

	ORG	0000
dirIni	RMB	2	direccion de inicio del vector
dirFin	RMB	2	direccion de fin del vector
mult4	RMB	1	1

	ORG	$C000
	CLR	mult4	limpio el contador
	LDX	dirIni	cargo en el reg indice x la primera direccion del vector
bucle	LDAA	0,x	cargo el contenido de la dir del reg indice x en acumA
	LSRA		muevo el LSB al carry
	BCS	noEs	si cy no es cero, no es multiplo de 4
	LSRA		muevo el nuevo LSB al carry
	BCS	noEs	si cy no es cero, no es multiplo de 4
	INC	mult4	cuento un multiplo de 4 encontrado
noEs	INX		incremento el indice x
	CPX	dirFin	comparo contra la dir de fin para no caerme del vector
	BLO	bucle	si no termine, vuelvo a ejecutar el bucle
fin	BRA	fin