* complementar a la base menos (complemento a 1) un numero de 16 bits
* guardar el resultado en otra direccion de memoria

	ORG	0000
dirNum	RMB	2		direccion del numero a complementar
cbm1	RMB	2		direccion del numero complementado

	ORG	$C000
	LDAA	#$ff		pongo al acumuladorA en la base menos 1
	LDAB	#$ff		pongo al acumuladorB en la base menos 1
	SUBA	dirNum		le resto a la base menos 1 la parte alta del numero
	SUBB	dirNum+1	le resto a la base menos 1 la parte baja del numero
	STD	cbm1		guarda el numero complementado
fin	BRA	fin