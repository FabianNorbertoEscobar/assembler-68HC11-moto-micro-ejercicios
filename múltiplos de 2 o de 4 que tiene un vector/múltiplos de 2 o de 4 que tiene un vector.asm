* contar multiplos de 2 o de 4 que tiene un vector
* conozco la cantidad de elementos que tiene el vector
* el vector se define en tiempo de ensamblado

	ORG	0000
mult2	RMB	1	cantidad de multiplos de 2
mult4 	RMB	1	cantidad de multiplos de 4
cant	EQU	$0A	cantidad de elementos del vector

	ORG	$0010
vec	DB	00,01,02,03,04,05,06,07,08,09

	ORG	$C000
	LDAB	#cant	cargo la cantidad de elementos del vector en acumB
	CLR	mult2	limpio el contador
	CLR	mult4	limpio el contador
	LDX	#vec	cargo la direccion de inicio del array en el indice x

bucle	LDAA	0,x	cargo el contenido de la dir del reg indice x en acumA
	LSRA		muevo el LSB al cy
	BCS	noEs	si cy no es 0, no es multiplo de 2
	INC	mult2	cuento un multiplo de 2 encontrado
	LSRA		muevo el LSB al cy
	BCS	noEs	si cy no es 0, no es multiplo de 4
	INC	mult4	cuento un multiplo de 4 encontrado
	

noEs	INX		incremento el contenido del indice x
	DECB		decremento el acumB, contador de elementos del vector
	BNE	bucle	si no llega a cero, vuelvo a ejecutar el bucle
fin	BRA	fin