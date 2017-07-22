* complementar a la base menos (complemento a 1) un numero de 16 bits
* guardar el resultado en otra direccion de memoria

	ORG	0000
dirNum	RMB	2		direccion del numero a complementar
cbm1	RMB	2		direccion del numero complementado

	ORG	$C000
	CLRA			limpio el acumA
	CLRB			limpio el acumB
	SUBA	#1		le resto 1 a acumA para ponerlo en FF
	SUBB	#1		le resto 1 a acumB para ponerlo en FF
	SUBA	dirNum		le resto a la base menos 1 la parte alta del numero
	SUBB	dirNum+1	le resto a la base menos 1 la parte baja del numero
	STD	cbm1		guarda el numero complementado
fin	BRA	fin