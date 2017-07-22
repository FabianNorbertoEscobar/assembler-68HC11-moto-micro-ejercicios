* complementar a la base menos (complemento a 1) un numero de 16 bits
* guardar el resultado en otra direccion de memoria

	ORG	0000
dirNum	RMB	2		direccion del numero a complementar
cbm1	RMB	2		direccion del numero complementado

	ORG	$C000
	LDAA	dirNum		cargo en acumA la parte alta del numero
	LDAB	dirNum+1	cargo en acumB la parte baja del numero
	COMA			complemento la parte alta del numero
	COMB			complemento la parte baja del numero
	STD	cbm1		guarda el numero complementado
fin	BRA	fin