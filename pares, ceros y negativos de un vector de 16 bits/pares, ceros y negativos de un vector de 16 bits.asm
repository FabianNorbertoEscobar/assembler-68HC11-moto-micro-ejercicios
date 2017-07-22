* recorrer un vector contando los ceros, pares y negativos
* conociendo direccion inicial y cantidad de elementos
* vector con elementos de 16 bits

		ORG	0000
pares		RMB	1		variables que uso como contadores
negas		RMB	1
ceros		RMB	1
cant		EQU	9		cantidad de elementos que tiene el vector
cuenta		RMB	1		llevo la cuenta en esta variacle ya que acumB esta ocupado

		ORG	$0010
vec		DB	00,01,02,03,04,$f1,$81,$80,$90,$a1

		ORG	$c000
		LDAB	#cant		cargo a acumB momentaneamente con la cantidad de elementos del vector
		STAB	cuenta		llevo el contenido del acumB a la variable cuenta<-- el contador
		CLR	pares		
		CLR	negas		limpio los contadores
		CLR	ceros		
		LDX	#vec		cargo en el indice X la direccion de inicio del vector
bucle		LDD	0,x		cargo en el regD el contenido de la direccion que tiene el registro indice
		RORA			roto a izquierda el acumA: LSB-->Cy
		BCS	esImpar		si el carry es cero, el numero es impar
		INC	pares		sino, es par-->> incremento el contador de pares

esImpar		ROLA			roto para volver al num original: CY-->LSB
		BNE	noCero		como ROLA actualiza zero, salto si no es cero
		INC	ceros		si no, es cero-->> incremento el contador de ceros

noCero		LDD	0,x		cargo el acumA el contenido de la direccion quei tiene el registro indice
		BPL	noNeg		como LDAA actualiza N, salto si es positivo
		INC	negas		sino, es negativo--> incremento el contador de negativos

noNeg		INX			voy al siguiente elemento del vector->incremento 2 veces xq las dir son de 16
		INX			
		DEC	cuenta		decremento cuenta en cada pasada
		BNE	bucle		vuelvo a ejecutar el bucle si el acumB no llega a cero
fin		BRA	fin