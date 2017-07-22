* TIPO DE TRIANGULO
* dados los lados de un triangulo, determinar que tipo de triangulo es:
* Q (equilatero),	I (isosceles)		o	E (escaleno)

		ORG		0000
lado1		RMB		1		reservo memoria para los lados del triangulo
lado2		RMB		1
lado3		RMB		1
tipoT		RMB		1		aqui indicare el tipo de triangulo
		
		ORG		$C000
main		LDAA		lado1		almaceno el lado1 en acumA
		CMPA		lado2		comparo el acumA contra el lado2
		BNE		noIg		salto si son diferentes-->>ya no es equilatero
		CMPA		lado3		sino, comparo acumA contra el lado3
		BEQ		esEq		salto si son iguales-->>es equilatero
		BRA		esIs		sino, salto si son diferentes-->>es isosceles

noIg		CMPA		lado3		comparo acumA contra el lado3
		BEQ		esIs		salto si son iguales-->es isosceles
		LDAA		lado2		almaceno el lado2 en acumA
		CMPA		lado3		comparo el acumA contra el lado3
		BNE		esEs		salto si son diferentes-->>es escaleno
		BRA		esIS		sino, salto si son iguales-->>es isosceles

esEq		LDAA		#'Q		cargo el ascii de Q en acumA
		STAA		tipoT		luego, lo almaceno en memoria
		BRA		fin

esIs		LDAA		#'I		cargo el ascii de I en acumA
		STAA		tipoT		luego, lo almaceno en memoria
		BRA		fin

esEs		LDAA		#'E		cargo el ascii de E en acumA
		STAA		tipoT		luego, lo almaceno en memoria
fin		BRA		fin