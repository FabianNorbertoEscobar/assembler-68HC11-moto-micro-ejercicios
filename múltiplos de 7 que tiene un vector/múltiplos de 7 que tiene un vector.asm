* contar los multiplos de 7 que tiene un vector
	
	ORG	0000
mult7	RMB	1	cuenta la cantidad de multiplos de 7

	ORG	$0010
vec	DB	$02,$06,$07,$15,$18,$0E,$23,$49,$1C,$32,$2A,$48,$54,$a1
finVec	DB	1	primera direccion de memoria fuera del vector

	ORG	$C000
	CLR	mult7	limpio el contador
	LDY	#vec	cargo en el reg indice Y la dir de inicio del vector

bucle	LDAB	0,y	cargo en parte baja de regD el cont de la dir del indice Y
	CLRA		limpio la parte alta de regD
	LDX	#07	cargo el divisor en el reg indice x
	IDIV		divido D/x: resultado--> IX	resto-->D
	CPD	#0	comparo regD contra 01. si cero es multiplo
	BNE	noEs	salto si no es multiplo
	INC	mult7	cuento un multiplo de 7 encontrado
	
noEs	INY		incremento la dir del reg indice Y
	CPY	#(finVec-1)	comparo contra la direccion de fin de Y
	BLO	bucle	si no me he caido del vector, ejecuto el bucle
fin 	BRA	fin