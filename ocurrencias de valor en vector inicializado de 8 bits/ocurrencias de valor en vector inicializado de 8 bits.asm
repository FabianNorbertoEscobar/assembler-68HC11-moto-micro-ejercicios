* cantidad de ocurrencias de un valor en un vector de elementos de 8 bits

		ORG	0000
valor		EQU	$f1		valor a buscar en el vector
veces		RMB	1		variable que uso como contador

		ORG	$0010
vec		DB	01,02,03,04,05,$f1,$a0,$f1,$f1,$f3
vecFin		DB	1

		ORG	$C000
		CLR	veces 		limpio el contador
		LDX	#vec		cargo en el indice X la direccion de inicio del vector
bucle		LDAA	0,x		cargo contenido de direccion del indice x en acumA
		CMPA	#valor		comparo acumA contra el valor buscado
		BNE	noEs		si no son iguales, paso al proximo
		INC	veces		sino, son iguales->> cuento aparicion

noEs		INX			incremento el indice X -> voy al proximo
		CPX	#(vecFin-1)	comparo indice X contra direccion final
		BLS	bucle		si < vuelvo a ejecutar el bucle
fin		BRA 	fin