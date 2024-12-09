All text before the header will be treated as comment, as long as you avoid
using the word "red" starting with a capital "R" in this pre-header text.
This is a temporary shortcoming of the used lexer but most of the time you
start your script or program with the header itself.

The header of a red script is the capitalized word "red" followed by a
whitespace character followed by a block of square brackets []. The block of
brackets can be filled with useful information about this script or program:
the author's name, the filename, the version, the license, a summary of what
the program does or any other files it needs. The red/System header is just
like the red header, only saying "red/System" and not "red".
Red []

;this is a commented line

print "Hello Red World"    ; this is another comment

comment {
    This is a multiline comment.
    You just saw the Red version of the "Hello World" program.
}

; Your program's entry point is the first executable code that is found
; no need to restrict this to a 'main' function.

; Valid variable names start with a letter and can contain numbers,
; variables containing only capital A through F and numbers and ending with 'h'
; are forbidden, because that is how hexadecimal numbers are expressed in Red
; and Red/System.

; assign a value to a variable using a colon ":"
my-name: "Red"
reason-for-using-the-colon: {Assigning values using the colon makes
 the equality sign "=" exclusively usable for comparisons purposes,
 exactly what "=" was intended for in the first place!
 Remember this y = x + 1 and x = 1 => y = 2 stuff from school?
}
is-this-name-valid?: true

; print output using print, or prin for printing without a newline or linefeed
; at the end of the printed text.

prin " My name is " print my-name
My name is Red

print ["My name is " my-name lf]
My name is Red

; If you haven't already noticed: statements do NOT end with a semicolon ;-)

;
; Datatypes
;
; If you know Rebol, you probably have noticed it has lots of datatypes. Red
; does not have yet all those types, but as Red want to be close to Rebol it
; will have a lot of datatypes.
; You can recognize types by the exclamation sign at the end. But beware
; names ending with an exclamation sign are allowed.
; Some of the available types are integer! string! block!

; Declaring variables before using them?
; Red knows by itself what variable is best to use for the data you want to
; use it for.
; A variable declaration is not always necessary.
; It is considered good coding practise to declare your variables,
; but it is not forced upon you by Red.
; You can declare a variable and specify its type. a variable's type
; determines its size in bytes.

; Variables of integer! type are usually 4 bytes or 32 bits
my-integer: 0
; Red's integers are signed. No support for unsigned atm but that will come.

; To find out the type of variable use type?
type? my-integer
integer!

; A variable can be initialized using another variable that gets initialized
; at the same time. Initialize here refers to both declaring a variable and
; assigning a value to it.
i2: 1 + i1: 1

; Arithmetic is straightforward
i1 + i2 ; result 3
i2 - i1 ; result 1
i2 * i1 ; result 2
i1 / i2 ; result 0 (0.5, but truncated towards 0)

; Comparison operators are probably familiar, and unlike in other languages
; you only need a single '=' sign for comparison. Inequality is '<>' like in Pascal.
; There is a boolean like type in Red. It has values true and false, but also
; the values on/off or yes/no can be used

3 = 2 ; result false
3 <> 2 ; result true
3 > 2 ; result true
3 < 2 ; result false
2 <= 2 ; result true
2 >= 2 ; result true

;
; Control Structures
;
; if
; Evaluate a block of code if a given condition is true. IF returns
; the resulting value of the block or 'none' if the condition was false.
if a < 0 [print "a is negative"]

; either
; Evaluate a block of code if a given condition is true, else evaluate an
; alternative block of code. If the last expressions in both blocks have the
; same type, EITHER can be used inside an expression.
either a > 0 [
   msg: "positive"
][
   either a = 0 [
       msg: "zero"
   ][
       msg: "negative"
   ]
]

print ["a is " msg lf]

; There is an alternative way to write this
; (Which is allowed because all code paths return a value of the same type):

msg: either a > 0 [
   "positive"
][
   either a = 0 [
       "zero"
   ][
       "negative"
   ]
]
print ["a is " msg lf]

; until
; Loop over a block of code until the condition at end of block, is met.
; UNTIL always returns the 'true' value from the final evaluation of the last expression.
c: 5
until [
   prin "o"
   c: c - 1
   c = 0    ; the condition to end the until loop
]
;   will output:
ooooo
; Note that the loop will always be evaluated at least once, even if the
; condition is not met from the beginning.

; while
; While a given condition is met, evaluate a block of code.
; WHILE does not return any value, so it cannot be used in an expression.
c: 5
while [c > 0][
   prin "o"
   c: c - 1
]
; will output:
ooooo

;
; Functions
;
; function example
twice: function [a [integer!] /one return: [integer!]][
        c: 2
        a: a * c
        either one [a + 1][a]
]
b: 3
print twice b   ; will output 6.

; Import external files with #include and filenames start with a % sign
#include %includefile.red
; Now the functions in the included file can be used too.
