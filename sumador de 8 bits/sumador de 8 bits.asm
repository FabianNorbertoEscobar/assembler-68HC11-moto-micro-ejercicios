* suma en 8 bits

		ORG		0000
dato1		DB		3		defino los datos a sumar
dato2		DB		12
result		RMB		1		reservo memoria para el resultado de la suma

		ORG		$C000
main		LDAA		dato1		cargo el primer sumando en acumA
		LDAB		dato2		cargo el segundo sumando en acumB
		ABA				suma los acumuladores y asigna en acumA
		STAA		result		almaceno el resultado en memoria
fin		BRA 		fin