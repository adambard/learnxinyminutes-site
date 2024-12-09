"This is a comment"

"A string:"
'This is a string with \'escaped\' characters.\n'

"A 30 bit integer"
23

"A 30 bit float"
3.2

"-20"
-14r16

"An object which only understands one message, 'x' which returns 20"
(|
  x = 20.
|)

"An object which also understands 'x:' which sets the x slot"
(|
  x <- 20.
|)

"An object which understands the method 'doubleX' which
doubles the value of x and then returns the object"
(|
  x <- 20.
  doubleX = (x: x * 2. self)
|)

"An object which understands all the messages
that 'traits point' understands". The parser
looks up 'traits point' by sending the messages
'traits' then 'point' to a known object called
the 'lobby'. It looks up the 'true' object by
also sending the message 'true' to the lobby."
(|     parent* = traits point.
       x = 7.
       y <- 5.
       isNice = true.
|)
"unary message, sends 'printLine' to the object '23'
which prints the string '23' to stdout and returns the receiving object (ie 23)"
23 printLine

"sends the message '+' with '7' to '23', then the message '*' with '8' to the result"
(23 + 7) * 8

"sends 'power:' to '2' with '8' returns 256"
2 power: 8

"sends 'keyOf:IfAbsent:' to 'hello' with arguments 'e' and '-1'.
Returns 1, the index of 'e' in 'hello'."
'hello' keyOf: 'e' IfAbsent: -1
[|:x. localVar| x doSomething with: localVar]
"returns 'HELLO'"
'hello' copyMutable mapBy: [|:c| c capitalize]

"returns 'Nah'"
'hello' size > 5 ifTrue: ['Yay'] False: ['Nah']

"returns 'HaLLO'"
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
    "Repeatedly sends 'value' to the first block while the result of sending 'value' to the
     second block is the 'true' object"
    [x > 0] whileTrue: [x: x - 1].
    x
] value
"Here is an object with one assignable slot 'x' and a method 'reduceXTo: y'.
Sending the message 'reduceXTo: 10' to this object will put
the object '10' in the 'x' slot and return the original object"
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
