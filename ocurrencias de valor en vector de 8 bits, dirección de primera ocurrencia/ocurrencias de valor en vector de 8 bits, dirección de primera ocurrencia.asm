* cantidad de ocurrencias de un valor en un vector de elementos de 8 bits
* se guarda la direccion de ocurrencia del primer valor del vector

		ORG	0000
valor		EQU	7		valor a buscar en el vector
dirIni		RMB	2		direccion de inicio del vector
dirFin		RMB 	2		direccion de fin del vector
dirOCu		RMB	2		aca va la direccion de la primera ocurrencia
veces		RMB	1		variable que uso como contador

		ORG	$C000
		CLR	veces 		limpio el contador
		LDX	#$0019		cargo en el indice X la direccion del ultimo elemento
bucle		LDAA	0,x		cargo contenido de direccion del indice x en acumA
		CMPA	#valor		comparo acumA contra el valor buscado
		BNE	noEs		si no son iguales, paso al proximo
		INC	veces		sino, son iguales->> cuento aparicion
		STX	dirOcu		grabo la direccion de ocurrencia

noEs		DEX			decremento el indice X -> voy al proximo
		CPX	dirIni		comparo indice X contra direccion final
		BLO	bucle		si < vuelvo a ejecutar el bucle
fin		BRA 	fin