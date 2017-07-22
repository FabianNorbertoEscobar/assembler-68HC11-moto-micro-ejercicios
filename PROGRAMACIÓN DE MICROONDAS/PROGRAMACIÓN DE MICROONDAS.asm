* EJERCICIO: PROGRAMACION DE MICROONDAS

* Se le encomienda realizar el programa para manejar las rutinas de seguridad de un horno microondas equipado con un 
* microcontrolador MC68HC11. Otro programador ha desarrollado las rutinas las rutinas de los programas de coccion.
* Cuando el horno este operando, el MSB	de la posicion de memoria $1010 (opera) estara en 1. El programa que usted
* desarrollara, debe supervisar el nivel de temperatura del emisor del microondas (magnetron), cuyo rango va entre 0 y 
* 1000 grados Celsius, valor que se almacenara a partir de la posicion $1020 (tempe). Si el valor de temperatura excede
* los 500 grados Celsius, debe apagar directamente el emisor de microondas y apagar el sistema de alarma. La temperatura
* del emisor del microondas se debe monitorear sin importar si el horno esta activado o no. Cuando el horno este operando,
* debe supervisar además, el estado de la puerta. La posicion de memoria %1030 (puerta) contiene un indicador de la misma.
* Si el valor alli almacenado es distinto de cero (00=puerta cerrada), debe apagar inmediatamente el emisor. Para apagar
* el emisor, escribira el valor 00 en la posicion de memoria $1040 (off). La alarma se activa cuando escribo un valor
* distinto de cero en la posicion $1050 (alarma). En caso de que se deba apagar la alarma, solo se podra apagarla,
* desenchufando el horno microondas (es decir, cortando la alimentacion de ka fuente).

* Este programa se realiza con POLLING

* area de constantes
opera		EQU		$1010		
tempe		EQU		$1020
puerta		EQU		$1030
off		EQU		$1040
alarma		EQU		$1050

*area programa principal
		ORG		$C000
loop		LDD		tempe		cargo la temperatura en el registro D
		CPD		#500		comparo la temperatura contra 500
		BLO		tempeOK		si la temperatura esta dentro de los limites aceptables, salto

		CLR		off		si no, apago el emisor del microondas o magnetron
		INC		alarma		enciendo la alarma
pum		BRA		pum		espero a que se desenchufe el microondas

tempeOK		LDAA		opera		cargo opera en el acumA
		ANDA		#$80		(% 1000 0000) verifico si el MSB esta en 1 -> o sea, veo si esta operando
		BEQ		loop		si no es asi, vuelvo al loop para verificar la temperatura

		LDAA		puerta		si opera, cargo puerta en acumA para ver si esta cerrada
		BEQ		loop		si esta cerrada, vuelvo al loop para verificar la temperatura

		CLR		off		si esta abierta, apago el microondas
		BRA		loop		vuelvo al loop para verificar la temperatura
