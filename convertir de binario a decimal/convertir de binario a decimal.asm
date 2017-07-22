* convertir de binario a decimal

		ORG	$0000
NUMERO		RMB	1		numero binario a convertir

		ORG	$0012
CENTENAS	RMB	1		centenas del numero convertido
DECENAS		RMB	1		decenas del numero convertido
UNIDADES	RMB	1		unidades del numero convertido

		ORG	$C000
		CLR	CENTENAS	inicializo las centenas
		CLR	DECENAS		inicializo las decenas

		LDAA	NUMERO		cargo el numero en acumA

loopCentenas	SUBA	#100		le resto 100
		BLT	finCentenas	si acumA es menor a cero, no hay mas centenas
		INC	CENTENAS	cuento una centena
		BRA	loopCentenas	vuelvo a comenzar el loop de las centenas

finCentenas	ADDA	#100		sumo 100 porque me pase

loopDecenas	SUBA	#10		le resto 10
		BLT	finDecenas	si acumAes menor a cero, no hay mas decenas
		INC	DECENAS		cuento una decena
		BRA	loopDecenas	vuelvo a comenzar el loop de las decenas

finDecenas	ADDA	#10		sumo 10 porque me pase

		STAA	UNIDADES	lo restante son las unidades

fin 		BRA	fin