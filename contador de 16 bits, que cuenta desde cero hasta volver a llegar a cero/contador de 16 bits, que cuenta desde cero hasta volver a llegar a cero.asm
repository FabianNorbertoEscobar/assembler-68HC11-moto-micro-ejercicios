* contador de 16 bits, que cuenta desde cero hasta volver a llegar a cero

	ORG	$C000
	STX	0
loop	INX
	BNE	loop
fin 	BRA	fin