* cantidad de ocurrencias de un valor en un vector con elementos de 16 bits

		ORG	0000
valor		EQU	$F1		valor a buscar en el vector
dirIni		RMB	2		direccion de inicio del vector
dirFin		RMB	2		direccion de fin del vector
veces		RMB	1		variable que utilizo como contador

		ORG	$C000
		CLR	veces		limpio el contador
bucle		LDD	0,x		cargo el regD con el contenido de la dir del indice x
		CPD	#valor		comparo al regD contra el valor que estoy buscando
		BNE	noEs		si no son iguales, voy al proximo
		INC	veces		si no, son iguales-> cuento una aparicion

noEs		INX
		INX			incremento dos veces el indice x porque las dir son de 16bits
		CPX	dirFin		comparo la direccion del indiceX contra la dir de fin
		BLO	bucle		si < vuelvo a ejecutar el bucle
fin		BRA	fin		