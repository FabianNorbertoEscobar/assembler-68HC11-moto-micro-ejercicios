*multiplicación mediante método de sumas sucesivas

		ORG		0000
factor1		RMB		1		reservo memoria para factores y resultado
factor2		RMB		1
mult		RMB		1

		ORG		$C000
inicio		CLRA				limpio acumA
		LDAB		factor1		cargo uno de los factores en acumB
ciclo		ADDA		factor2		acumulo el otro factor en acumA
		DECB				decremento acumB
		BNE		ciclo		repito ciclo hasta llegar a cero
		STAA		mult		cargo el resultado en memoria
fin		BRA		fin