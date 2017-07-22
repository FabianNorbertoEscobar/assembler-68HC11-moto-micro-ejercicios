* cantidad de ocurrencias de un valor en un vector con elementos de 16 bits

		ORG	0000
valor		EQU	$F1		valor a buscar en el vector
veces		RMB	1		variable que utilizo como contador

		ORG	$0010
vec		DW	$0101,$0102,$00f1,$a0f1,$00f1	//inicializo al vector en tiempo de ensamblado
vecFin		DB	1		con esta variable, obtengo donde termina el vector

		ORG	$C000
		CLR	veces		limpio el contador
		LDX	#vec		cargo en el indice x la direccion de inicio del vector
bucle		LDD	0,x		cargo el regD con el contenido de la dir del indice x
		CPD	#valor		comparo al regD contra el valor que estoy buscando
		BNE	noEs		si no son iguales, voy al proximo
		INC	veces		si no, son iguales-> cuento una aparicion

noEs		INX
		INX			incremento dos veces el indice x porque las dir son de 16bits
		CPX	#(vecFin-1)	comparo la direccion del indiceX contra la dir de fin
		BLO	bucle		si < vuelvo a ejecutar el bucle
fin		BRA	fin		