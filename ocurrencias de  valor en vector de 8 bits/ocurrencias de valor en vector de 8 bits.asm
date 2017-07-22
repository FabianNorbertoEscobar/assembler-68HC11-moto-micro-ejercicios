* cantidad de ocurrencias de un valor en un vector de elementos de 8 bits

		ORG	0000
valor		EQU	7		valor a buscar en el vector
dirIni		RMB	2		direccion de inicio del vector
dirFin		RMB 	2		direccion de fin del vector
veces		RMB	1		variable que uso como contador

		ORG	$C000
		CLR	veces 		limpio el contador
bucle		LDAA	0,x		cargo contenido de direccion del indice x en acumA
		CMPA	#valor		comparo acumA contra el valor buscado
		BNE	noEs		si no son iguales, paso al proximo
		INC	veces		sino, son iguales->> cuento aparicion

noEs		INX			incremento el indice X -> voy al proximo
		CPX	dirFin		comparo indice X contra direccion final
		BLO	bucle		si < vuelvo a ejecutar el bucle
fin		BRA 	fin