* cantidad de apariciones de un elemento en un vector

		ORG	$0000
CANT		DW	256		cantidad de elementos del vector
PUNT		RMB	2		direccion de inicio del vector
DATO		RMB	1		dato buscado
VECES		RMB	1		cantidad de apariciones del dato buscado en el vector

		ORG	$C000
		CLR	VECES		pongo en cero el contador de la cantidad de apariciones del dato buscado en el vector
		LDAB	CANT		cargo la cantidad de elementos en acumB
		LDX	PUNT		cargo la direccion de inicio del vector en el registro índice X

loop		LDAA	0,x		cargo el elemento de esa posicion del vector en el acumA
		CMPA	DATO		lo comparo contra el dato buscado
		BNE	sig		si no es, paso al siguiente elemento del vector
		INC	VECES		cuento la aparicion del dato buscado en el vector

sig		INX 			muevo el puntero del vector al siguiente elemento
		DECB			decremento la cantidad de elementos del vector que falta analizar
		BNE	loop		si no llego a cero, entonces analizo otro elemento del vector

fin 		BRA	fin