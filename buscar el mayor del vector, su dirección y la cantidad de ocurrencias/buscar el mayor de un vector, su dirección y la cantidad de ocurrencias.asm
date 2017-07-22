* buscar mayor elemento de un vector, su direccion y la cantidad de ocurrencias

		ORG	$0000
CANT		RMB	1		cantidad de elementos del vector
PUNT		RMB	2		direccion de inicio del vector
MAYOR		RMB	1		mayor elemento del vector
DIR		RMB	2		direccion del mayor
VECES		RMB	1		cantidad de apariciones del mayor

		ORG	$C000
main		CLR	VECES		limpio el contador de ocurrencias
		INC 	VECES		cuento al primero, el mayor
		
		LDAB	CANT		cargo la cantidad de elementos del vector en el acumB
		LDX	PUNT		cargo la direccion de inicio del vector en el indice X

		STX	DIR		la direccion del primero es la direccion del mayor
		BRA	sig		no debo comparar al primero

loop		LDAA	0,x		cargo el elemento de la posicion apuntada por el indice X en el acumA
		CMPA	MAYOR		lo comparo contra el mayor
		
		BLO	sig		si es menor, paso al siguiente
		BEQ	appear		si es igual, nueva ocurrencia
		
		STAA	MAYOR		reemplazo el mayor por el nuevo mayor
		STX	DIR		cargo la direccion del mayor con la direccion apuntada por el indice X
			
		CLR	VECES		pongo en cero la cantidad de ocurrencias del mayor

appear		INC	VECES		cuento la ocurrencia

sig		INX			paso al siguiente elemento del vector
		DECB			decremento la cantidad de elementos del vector que falta analizar
		
		BNE	loop		si no llego a cero, sigo dentro del loop
fin 		BRA	fin