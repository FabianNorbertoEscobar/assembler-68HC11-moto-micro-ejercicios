* ordenar por burbujeo numeros no signados de menor a mayor

		ORG	$0000
vector		DB	09,04,03,05,02,$FA,$30,$90,$10
rotcev		DB	1

		ORG	$C000
main		LDY	#vector			cargo el indice Y con la direccion de inicio del vector
bucE		LDX	#vector 		cargo el indice X con la direccion de inicio del vector
bucI		LDAA	0,x			cargo el acumB con el contenido de la dir del indice x
		CMPA	1,x			comparo acumA contra el contenido de la sig dir del ind X
		BLS	noPro			si <= no corresponde intercambiar->paso al proximo
		LDAB	1,x			cargo el acumB con el contenido de la sig dir del indice x
		STAA	1,x			almaceno el acumA en la sig direccion del indice x
		STAB	0,x			almaceno el acumB en la direccion del indice x

noPro		INX				voy al siguiente
		CPX	#(rotcev-1)		comparo indice x contra dir del ultimo elemento del vector
		BLO	bucI			si < ejecuto bucle interno-> sigo con la pasada
		INY				sino, muevo el puntero del inicio al siguiente
		CPY	#(rotcev-1)		comparo indice y contra dir del ultimo elemento del vector
		BLO	bucE			si < ejecuto bucle externo-> comienzo una nueva pasada
fin 		BRA	fin