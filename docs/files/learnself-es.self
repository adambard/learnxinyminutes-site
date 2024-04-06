
"Esto es un comentario"

"Una cadena de caracteres (string):"
'Esto es un string con \'caracteres\' escapados.\n'

"Un entero de 30 bits"
23

"Un decimal de 30 bits"
3.2

"-20"
-14r16

"Un objeto que solo entiende un mensaje, 'x' que regresa 20"
(|
  x = 20.
|)

"Un objeto que además entiende 'x:' que establece la posición x"
(|
  x <- 20.
|)

"Un objeto que entiende el método 'doubleX' el cual
duplica el valor de x y luego regresa el objeto"
(|
  x <- 20.
  doubleX = (x: x * 2. self)
|)

"Un objeto que entiende todos los mensajes
que 'traits point' entiende". El intérprete
mira a 'traits point' enviando los mensajes
'traits' y luego 'point' a un objeto conocido llamado
el 'lobby'. El mira el objeto 'true' enviando
también el mensaje 'true' al lobby."
(|     parent* = traits point.
       x = 7.
       y <- 5.
       isNice = true.
|)

"mensaje unario, envía 'printLine' al objeto '23'
que imprime el string '23' en stdout y regresa el objeto recibido (ejem 23)"
23 printLine

"envía el mensaje '+' con '7' para '23', luego el mensaje '*' con '8' para el resultado"
(23 + 7) * 8

"envía 'power:' para '2' con '8' regresa 256"
2 power: 8

"envía 'keyOf:IfAbsent:' para 'hello' con los argumentos 'e' y '-1'.
Regresa 1, el índice de 'e' en 'hello'."
'hello' keyOf: 'e' IfAbsent: -1

[|:x. localVar| x doSomething with: localVar]

"regresa 'HELLO'"
'hello' copyMutable mapBy: [|:c| c capitalize]

"regresa 'Nah'"
'hello' size > 5 ifTrue: ['Yay'] False: ['Nah']

"regresa 'HaLLO'"
'hello' copyMutable mapBy: [|:c|
   c = 'e' ifTrue: [c capitalize]
            False: ['a']]

"returns An 'E'! How icky!"
'hello' copyMutable mapBy: [|:c. tmp <- ''|
   tmp: c capitalize.
   tmp = 'E' ifTrue: [^ 'An \'E\'! How icky!'].
   c capitalize
   ]

"returns 0"
[|x|
    x: 15.
    "Envía repetidamente 'value' al primer bloque mientras el resultado de enviar 'value' al segundo bloque es el objeto 'true'"
    [x > 0] whileTrue: [x: x - 1].
    x
] value

"Aquí tenemos un objeto con una ranura asignable 'x' y un método 'reduceXTo: y'.
Enviando el mensaje 'reduceXTo: 10' a este objeto pondrá
el objeto '10' en la ranura 'x' y regresará el objeto original"
(|
    x <- 50.
    reduceXTo: y = (
        [x > y] whileTrue: [x: x - 1].
        self)
|)
.

| d |
d: dictionary copy.
d at: 'hello' Put: 23 + 8.
d at: 'goodbye' Put: 'No!.
"Prints No!"
( d at: 'goodbye' IfAbsent: 'Yes! ) printLine.
"Prints 31"
( d at: 'hello' IfAbsent: -1 ) printLine.

