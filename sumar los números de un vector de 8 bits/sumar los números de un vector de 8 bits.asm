* recorrer un vector con numeros de 8 bits y sumarlos (trabajando con no signados)

		ORG	0000
suma		RMB	2		reservo 2bytes por si me paso de 255

		ORG	$0010
vector		DB	02,04,05,$FA,$30,$90,$10	//la suma deberia dar 1D5
rotcev		DB	1		reservo dummy para la direccion final

		ORG	$C000
		CLR	suma		limpio la parte alta y la parte baja de la variable suma
		CLR	suma+1		(esta limnpieza no es necesaria porque luego piso estos valores)
		LDX	#vector		cargo en el indice X la direccion de inicio del vector
		LDAA	#0		la parte alta la pongo en cero porque estoy sumando numeros de 8bits
		LDAB	0,x		en la parte baja almaceno el numero que deseo sumar
		STD	suma		al primer sumando lo almaceno en suma
bucle		INX			voy al siguiente elemento del vector
		LDAA	#0		la parte alta la pongo en cero porque estoy sumando numeros de 8 bits
		LDAB	0,x		en la parte baja almaceno ek numero que deseo sumar
		ADDD	suma		sumo al regD lo que tiene la suma y almaceno en regD
		STD	suma		luego, llevo esto a memoria
		CPX	#(rotcev-1)	comparo al indice X con la direccion del ultimo elemento del vector
		BLO	bucle		si es < ejecuto nuevamente el bucle
fin		BRA	fin