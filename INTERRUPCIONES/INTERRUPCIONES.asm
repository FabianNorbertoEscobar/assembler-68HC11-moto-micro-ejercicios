* INTERRUPCIONES

* Dado un microcontralador Motorola MC68HC11 cuyo timer ha sido programado para generar interrupciones cada
* 500ms, codifique la rutina de atencion a la interrupcion para mantener en tres posiciones de memoria (desde
* la posicion $0000) la hora, los minutos y los segundos transcurridos. La interrupcion empleada es Timer
* Imput Capture 3, cuyo vector debe almacenarse en $FFEA y $FFEB segun el manual del microcontrolador. De
* igual forma, codifique otra interrupcion cuyo vector se buscara en $FFDA y $FFDB para inicializar en cero
* el reloj, como si de un cronometro se tratase.

* area de reserva
		ORG	$0000
HH		RMB	1		cuento las horas
MM		RMB	1		cuento los minutos
SS		RMB	1		cuento los segundos
MS		RMB	1		cuento los medio segundos o 500 milisegundos

* vectores de ISR
		ORG	$FFEA
		DW	TIC3		almaceno la direccion de la interrupcion Timer Imput Capture 3

		ORG	$FFDA
		DW	INICIO		almaceno la direccion de la interrupcion que inicializa el reloj

* area del programa principal
		ORG	$C000
main		CLR	HH		limpio las horas
		CLR	MM		limpio los minutos
		CLR	SS		limpio los segundos
		CLR	MS		limpio los medio segundos o 500 milisegundos
		
		LDS	#$00FF		cargo en el stack pointer la direccion de inicio de la rutina
		CLRA			limpio el acumA y lo transfiero al CCR para habilitar interrupciones
		TAP			esta es la unica forma en que puedo poner en cero los flags X e I

fin		BRA	fin

* area de la primera rutina de atencion
		ORG	$D000
INICIO		CLR	HH		limpio las horas
		CLR	MM		limpio los minutos
		CLR	SS		limpio los segundos
		CLR	MS		limpio los medio segundos o 500 milisegundos

		RTI			retorno el control luego de ejecutar rutina de atencion a interrupcion

* area de la segunda rutina de atencion
		ORG	$E000
TIC3		INC	MS		incremento los medio segundos o 500 milisegundos
		LDAA	MS		cargo los medio segundos o 500 milisegundos en el acumA
		CMPA	#1		comparo para ver si llego a 1000 milisegundos o 1 segundo
		BEQ	nollego		si no llego, salto
		
		CLR	MS		como llego a 1 seg, vuelvo, vuelvo a cero y debo aumentar los segundos

		INC	SS		incremento los segundos
		LDAA	SS		cargo los segundos en el acumA
		CMPA	#60		comparo para ver si llego a 60
		BNE	nollego		si no llego, salto
		
		CLR	SS		como llegue a 60 segundos, vuelvo a cero y debo aumentar los minutos

		INC	MM		incremento los minutos
		LDAA	MM		cargo los minutos en el acumA
		CMPA	#60		comparo para ver si llego a 60
		BNE	nollego		si no llego, salto

		CLR	MM		como llegue a 60 minutos, vuelvo a cero y debo aumentar las horas

		INC 	HH		incremento las horas
		LDAA	HH		cargo las horas el acumA
		CMPA	#24		comparo para ver si llego a 24
		BNE	nollego		si no llego, salto
			
		CLR	HH		como llegue a 24 horas, vuelvo a cero y comienza un nuevo dia
		
nollego		RTI			retorno el control luego de ejecutar rutina de atencion a interrupcion
