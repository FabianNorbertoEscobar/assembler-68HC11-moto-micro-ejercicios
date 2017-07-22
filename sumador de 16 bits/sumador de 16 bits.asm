* suma en 16 bits

		ORG		0000
dato1		DB		$80		defino los datos en hexadecimal
dato2		DB		$87
resul		RMB		2		reservo dos bytes para guardar el resultado

		ORG		$C000
main		CLR		resul		limpio la memoria reservada para el resultado
		LDAA		dato1		grabo el primer sumando en el acumA
		LDAB		dato2		grabo el segundo sumando en el acumB
		ABA				sumo los acumuladores y asigno en acumA
		BCC		noCy		salto si no hay carry
		INC		resul		si carry, incremento la parte alta del resultado
noCy		STAA		resul+1		almaceno el acumA en la parte baja del resultado
fin		BRA		fin