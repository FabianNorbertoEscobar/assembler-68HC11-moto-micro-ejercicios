* ejercicio de POLLING
* Un sistema de computador incluye como elemento de entrada un teclado numerico.
* Su interfaz incluye un registro de estado REGSTA que indica, en su bit menos,
* que se acciono una tecla y un registro de datos REGDAT donde se almacena el 
* codigo de la tecla cuyo contenido coincide con el valor numerico de la tecla,
* en caso de ser numerica, o muestra los valores 10H o 20H en caso de haberse
* accionado una tecla no numerica (10H para numeral, 20H para asterisco. Esta es
* una rutina que almacena en un vector los valores de las teclas numericas
* presionadas. En caso de que tecla presionada no sea numerica, sera indicado con
* el valor 33H en una posicion denominada NONUMERO. El registro REGSTA esta
* mapeado en memoria en la direccion 1010H y el registro REGDAT en la direccion
* 1011H, ambos de 8 bits. Luego de cada lectura del registro REGSTA, la interfaz
* vuelve su valor a 00.


* organizacion de la memoria perteneciente a la interfaz de entradas y salidas
		ORG	$1010	
REGSTA		RMB	1	registro de estado->LSB en 1 si se presiona tecla 
REGDAT		RMB	1	registro de datos->almacena el codigo de la tecla

* organizacion de la memoria RW en que estan las variables a utilizar
		ORG	$0000
NONUMERO	RMB	1	contiene 33H si tecla presionada no es numerica
DIRINI		RMB	2	direccion inicisl del vector de codigos de tecla

* organizacion de la memoria RW en que se ejecuta la rutina
		ORG	$C000
		LDX	DIRINI	cargo el indice X con el inicio del vector

bucle		LDAA	REGSTA	cargo el registro de estado en acumA
		ANDA	#$01	verifico si se ha presionado una tecla
		BEQ	bucle	si no se presiono, vuelvo a ejecutar el bucle

		LDAA	REGDAT	si se presiono, cargo el codigo en acumA

		CMPA	#$10	verifico si se trata del numeral
		BEQ	GnoNum	si es numeral, lo indico en NONUMERO
		CMPA	#$20	verifico si se trata del asterisco
		BEQ	GnoNum  si es asterisco, lo indico en NONUMERO
		
		STAA	0,x	grabo el codigo de la tecla en el vector
		INX		paso a la siguiente posicion del vector
		BRA	bucle	vuelvo a ejecutar el bucle

GnoNum		LDAA	#$33	cargo el acumA con la señal acordada
		STAA	NONUMERO	y almaceno->indico que la tecla no es num
		BRA	bucle	vuelvo a ejecutar el bucle