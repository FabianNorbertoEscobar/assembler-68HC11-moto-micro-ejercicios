# Prácticas de Ensamblador Motorola 68HC11

Colección de prácticas de **Arquitectura de Computadoras** desarrolladas con lenguaje ensamblador para el microcontrolador **Motorola 68HC11**.

Este repositorio reúne ejercicios de direccionamiento, aritmética binaria, manejo de vectores, control de flujo, entrada/salida, polling, interrupciones y comportamiento de tipos de datos. Incluye el código fuente en ensamblador, los archivos listados generados por el entorno y las imágenes en formato S-record utilizadas para cargar o simular los programas.

## Tecnologías y herramientas

| Tecnología | Uso en el repositorio |
| --- | --- |
| Ensamblador Motorola 68HC11 | Implementación de instrucciones, registros, memoria y rutinas de interrupción |
| Lenguaje simbólico / ensamblador | Archivos fuente con extensión `.asm` |
| Motorola S-record | Archivos `.S19` con la imagen de memoria de cada práctica |
| Listados de ensamblador | Archivos `.LST` con direcciones y código generado |
| C++ | Ejemplo complementario sobre representación y desbordamiento de tipos de datos |
| Code::Blocks | Proyecto de escritorio usado para la práctica en C++ |
| Git | Control de versiones del material |

El repositorio contiene **40 prácticas en ensamblador** organizadas en carpetas independientes.

## Funcionalidades y temas tratados

### Aritmética y operaciones binarias

- Suma de operandos de 8 y 16 bits.
- Multiplicación mediante sumas sucesivas.
- Contadores de 16 bits y control de desbordamiento.
- Complemento a la base menos uno de números de 16 bits, con tres variantes.
- Conversión de binario a decimal.
- Clasificación de un número respecto de 128.
- Determinación del tipo de triángulo a partir de sus lados.
- Programa aritmético `s = p + q - r`.

### Procesamiento de vectores

- Buscar máximos y mínimos de vectores signados y no signados.
- Contar apariciones de un dato.
- Buscar la primera o todas las ocurrencias de un valor.
- Obtener la dirección del mayor elemento y su cantidad de apariciones.
- Contar múltiplos de 2, 4 y 7.
- Clasificar pares, ceros y números negativos.
- Sumar los elementos de vectores de 8 bits.
- Generar una sumatoria de 16 bits a partir de elementos de 8 bits.
- Ordenar vectores mediante algoritmos de burbujeo y selecciones sucesivas.

### Acceso a memoria y direccionamiento

- Reservas de memoria con `RMB`.
- Inicialización de variables con `DB`.
- Direcciones absolutas y indexadas.
- Uso de los registros índice `X` e `Y`.
- Manipulación de registros acumuladores `A`, `B` y `D`.
- Pila y registro de estado del procesador.

### Control de entradas y interrupciones

- **Polling:** consulta periódica de un registro de estado para detectar teclas presionadas.
- **Interrupciones:** reloj de horas, minutos y segundos basado en Timer Input Capture 3.
- Rutinas de atención a interrupciones con retorno mediante `RTI`.
- Supervisión de temperatura y estado de puerta en una práctica de programación de microondas.

### Alto nivel y bajo nivel

Una práctica adicional en C++ demuestra cómo los tipos de datos y el tamaño reservado en memoria afectan:

- Desbordamiento de enteros.
- Conversión entre enteros y reales.
- Representación de caracteres.
- Límites de variables `short`, `int`, `long`, `float` y `char`.

## Índice de prácticas

| Área | Prácticas |
| --- | --- |
| Aritmética | [sumador de 8 bits](./sumador%20de%208%20bits), [sumador de 16 bits](./sumador%20de%2016%20bits), [multiplicación mediante sumas sucesivas](./multiplicación%20mediante%20sumas%20sucesivas), [ejercicio 5.05](./ejercicio%205.05) |
| Complementos | [complemento a la base menos 1 de un numero de 16 bits v1](./complemento%20a%20la%20base%20menos%201%20de%20un%20numero%20de%2016%20bits_%20v1), [versión 2](./complemento%20a%20la%20base%20menos%201%20de%20un%20numero%20de%2016%20bits_v2), [versión 3](./complemento%20a%20la%20base%20menos%201%20un%20numero%20de%2016%20bits_v3) |
| Conversiones y clasificación | [convertir de binario a decimal](./convertir%20de%20binario%20a%20decimal), [numero mayor, igual o menor que 128](./numero%20mayor,%20igual%20o%20menor%20que%20128), [tipo de triángulo](./tipo%20de%20triángulo) |
| Máximos y mínimos | [máximo no signado](./máximo%20de%20un%20array%20de%20elementos%20no%20signados%20de%208%20bits), [máximo signado](./máximo%20de%20un%20array%20de%20elementos%20signados%20de%208%20bits), [mínimo no signado](./mínimo%20de%20un%20array%20de%20elementos%20no%20signados%20de%208%20bits), [mínimo signado](./mínimo%20de%20un%20array%20de%20elementos%20signados%20de%208%20bits) |
| Ocurrencias y búsquedas | [cantidad de apariciones](./cantidad%20de%20apariciones%20de%20un%20dato%20en%20un%20vector), [apariciones de valor en vector de 8 bits](./ocurrencias%20de%20%20valor%20en%20vector%20de%208%20bits), [vector de 16 bits](./ocurrencias%20de%20valor%20en%20vector%20de%2016%20bits), [dirección de la primera ocurrencia](./ocurrencias%20de%20valor%20en%20vector%20de%208%20bits,%20dirección%20de%20primera%20ocurrencia), [buscar mayor y ocurrencias](./buscar%20el%20mayor%20del%20vector,%20su%20dirección%20y%20la%20cantidad%20de%20ocurrencias) |
| Vectores inicializados | [ocurrencias inicializadas de 8 bits](./ocurrencias%20de%20valor%20en%20vector%20inicializado%20de%208%20bits), [ocurrencias inicializadas de 16 bits](./ocurrencias%20de%20valor%20en%20vector%20inicializado%20de%2016%20bits) |
| Múltiplos y clasificación | [múltiplos de 2](./múltiplos%20de%202%20que%20tiene%20un%20vector), [múltiplos de 4](./múltiplos%20de%204%20que%20tiene%20un%20vector), [múltiplos de 7](./múltiplos%20de%207%20que%20tiene%20un%20vector), [múltiplos de 2 o 4](./múltiplos%20de%202%20o%20de%204%20que%20tiene%20un%20vector), [pares, ceros y negativos de 8 bits](./pares,%20ceros%20y%20negativos%20de%20un%20vector%20de%208%20bits), [pares, ceros y negativos de 16 bits](./pares,%20ceros%20y%20negativos%20de%20un%20vector%20de%2016%20bits) |
| Sumatorias | [sumar un vector de 8 bits](./sumar%20los%20números%20de%20un%20vector%20de%208%20bits), [sumatoria de 16 bits](./sumatoria%20en%2016%20bits%20de%20un%20vector%20de%20elementos%20de%208%20bits) |
| Ordenamiento | [menor a mayor no signado](./ordenar%20de%20menor%20a%20mayor%20un%20vector%20de%20números%20no%20signados%20de%208%20bits), [burbujeo mayor a menor no signado](./ordenar%20por%20burbujeo%20números%20no%20signados,%20de%20mayor%20a%20menor), [burbujeo menor a mayor no signado](./ordenar%20por%20burbujeo%20números%20no%20signados,%20de%20menor%20a%20mayor), [burbujeo mayor a menor signado](./ordenar%20por%20burbujeo%20números%20signados,%20de%20mayor%20a%20menor), [burbujeo menor a mayor signado](./ordenar%20por%20burbujeo%20números%20signados%20de%20menor%20a%20mayor) |
| Contadores | [contador de 16 bits](./contador%20de%2016%20bits,%20que%20cuenta%20desde%20cero%20hasta%20volver%20a%20llegar%20a%20cero) |
| Entradas y salida | [POLLING](./POLLING), [INTERRUPCIONES](./INTERRUPCIONES), [PROGRAMACIÓN DE MICROONDAS](./PROGRAMACIÓN%20DE%20MICROONDAS) |
| Direccionamiento | [ejercicio 5.01](./ejercicio%205.01), [ejercicio 5.02](./ejercicio%205.02) |
| Alto nivel | [tipo de dato: relación alto y bajo nivel](./tipo%20de%20dato_relación%20alto%20y%20bajo%20nivel) |

## Organización de una práctica

La mayoría de las carpetas contiene tres archivos relacionados:

```text
práctica/
├── práctica.asm  # Código fuente comentado
├── práctica.LST  # Listado generado por el ensamblador
└── práctica.S19  # Imagen ejecutable en formato S-record
```

Los archivos `.asm` pueden incluir:

- Comentarios con el enunciado y los objetivos.
- Reserva de memoria en el origen `$0000`.
- Variables y vectores inicializados.
- Programa principal ubicado normalmente en `$C000`.
- Rutinas auxiliares ubicadas en otras regiones de memoria.
- Una instrucción de parada o bucle infinito al finalizar el programa.

## Cómo explorar el repositorio

1. Elegir una práctica desde el índice.
2. Leer primero el encabezado del archivo `.asm`; suele contener el enunciado.
3. Revisar las secciones `ORG`, variables, programa principal y rutinas.
4. Abrir el `.LST` para relacionar instrucciones fuente con direcciones y bytes generados.
5. Cargar o ejecutar el `.S19` en un ensamblador, simulador o entorno compatible con Motorola 68HC11.
6. Para la práctica C++ adicional, abrir el archivo `.cbp` con Code::Blocks o compilar `main.cpp` con un compilador compatible.

> Las direcciones usadas en las prácticas representan ejemplos académicos del HC11. Para ejecución física, deben respetarse el mapa de memoria del hardware y las interfaces configuradas.

## Competencias desarrolladas

- Lectura y escritura de registros de 8 y 16 bits.
- Traducción de algoritmos a instrucciones de bajo nivel.
- Implementación de ciclos y control de flujo.
- Recorrido y modificación de arreglos en memoria.
- Uso de condiciones de salto y banderas.
- Comparación de valores signados y no signados.
- Separación de datos, programa y rutinas de servicio.
- Comprensión de polling, interrupciones y vectores de interrupción.
- Relación entre estructuras de alto nivel y representación binaria.

## Créditos

Repositorio mantenido por **Fabian Norberto Escobar** como material de prácticas de Arquitectura de Computadoras y lenguaje ensamblador.
