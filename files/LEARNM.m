fib ; compute the first few Fibonacci terms
    new i,a,b,sum
    set (a,b)=1 ; Initial conditions
    for i=1:1 do  quit:sum>1000
    . set sum=a+b
    . write !,sum
    . set a=b,b=sum
 ;   Comments start with a semicolon (;)
;   Strings - Characters enclosed in double quotes.
;       "" is the null string. Use "" within a string for "
;       Examples: "hello", "Scrooge said, ""Bah, Humbug!"""
;
;   Numbers - no commas, leading and trailing 0 removed.
;       Scientific notation with 'E'.  (not 'e')
;       Numbers with at least with IEEE 754 double-precision values (guaranteed 15 digits of precision)
;       Examples: 20 (stored as 20) , 1e3 (stored as 1000), 0500.20 (stored as 500.2),
;                 the US National Debt AT sometime on 12-OCT-2020 retrieved from http://www.usdebt.org is 27041423576201.15)
;                     (required to be stored as at least 27041422576201.10 but most implementations store as 27041432576201.15)
;
;   Truthvalues - String interpreted as 0  is used for false and any string interpreted as non-zero (such as 1) for true.
WRITE !,"hello world"
w !,"foo bar"," ","baz"
READ var
r !,"Wherefore art thou Romeo? ",why
r !,"Better one, or two? ",lorem," Better two, or three? ",ipsum
SET name="Benjamin Franklin"
s centi=0.01,micro=10E-6
w !,centi,!,micro

;.01
;.00001
KILL centi
k micro
s ^cars=20
s ^cars("Tesla",1,"Name")="Model 3"
s ^cars("Tesla",2,"Name")="Model X"
s ^cars("Tesla",2,"Doors")=5

w !,^cars
; 20
w !,^cars("Tesla")
; null value - there's no value assigned to this node but it has children
w !,^cars("Tesla",1,"Name")
; Model 3
; A log of temperatures by date and time
s ^TEMPS("11/12","0600",32)=""
s ^TEMPS("11/12","1030",48)=""
s ^TEMPS("11/12","1400",49)=""
s ^TEMPS("11/12","1700",43)=""
; Assignment:       =
; Unary:            +   Convert a string value into a numeric value.
; Arthmetic:
;                   +   addition
;                   -   subtraction
;                   *   multiplication
;                   /   floating-point division
;                   \   integer division
;                   #   modulo
;                   **  exponentiation
; Logical:
;                   &   and
;                   !   or
;                   '   not
; Comparison:
;                   =   equal
;                   '=  not equal
;                   >   greater than
;                   <   less than
;                   '>  not greater / less than or equal to
;                   '<  not less / greater than or equal to
; String operators:
;                   _   concatenate
;                   [   contains ­          a contains b
;                   ]]  sorts after  ­      a comes after b
;                   '[  does not contain
;                   ']] does not sort after
w 5+3*20
;160
;You probably wanted 65
write 5+(3*20)
; Execute the 'tag' function, which has two parameters, and write the result.
w !,$$tag^routine(a,b)
d ^routine    ;run a routine from the beginning.
;             ;routines are identified by a caret.
d tag         ;run a tag in the current routine
d tag^routine ;run a tag in different routine
set a=1
if a=1 do
. write !,a
. read b
. if b > 10 d
. . w !, b
w "hello"
; RECTANGLE - a routine to deal with rectangle math
    q ; quit if a specific tag is not called

main
    n length,width ; New length and width so any previous value doesn't persist
    w !,"Welcome to RECTANGLE. Enter the dimensions of your rectangle."
    r !,"Length? ",length,!,"Width? ",width
    d area(length,width)            ;Do/Call subroutine using a tag
    s per=$$perimeter(length,width)      ;Get the value of a function
    w !,"Perimeter: ",per
    quit

area(length,width)  ; This is a tag that accepts parameters.
                    ; It's not a function since it quits with no value.
    w !, "Area: ",length*width
    q  ; Quit: return to the previous level of the stack.

perimeter(length,width)
    q 2*(length+width) ; Returns a value using Quit ; this is a function
;Finite loop with counter
;f var=start:increment:stop

f i=0:5:25 w i," "
;0 5 10 15 20 25

; Infinite loop with counter
; The counter will keep incrementing forever. Use a conditional with Quit to get out of the loop.
;f var=start:increment

f j=1:1 w j," " i j>1E3 q
; Print 1-1000 separated by a space

;Argumentless for - infinite loop. Use a conditional with Quit.
;   Also read as "forever" - f or for followed by two spaces.
s var=""
f  s var=var_"%" w !,var i var="%%%%%%%%%%" q
; %
; %%
; %%%
; %%%%
; %%%%%
; %%%%%%
; %%%%%%%
; %%%%%%%%
; %%%%%%%%%
; %%%%%%%%%%
; Conditional using traditional if/else
r "Enter a number: ",num
i num>100 w !,"huge"
e i num>10 w !,"big"
e w !,"small"

; Postconditionals are especially useful in a for loop.
; This is the dominant for loop construct:
;   a 'for' statement
;   that tests for a 'quit' condition with a postconditional
;   then 'do'es an indented block for each iteration

s var=""
f  s var=var_"%" q:var="%%%%%%%%%%" d  ;Read as "Quit if var equals "%%%%%%%%%%"
. w !,var

;Bonus points - the $L(ength) built-in function makes this even terser

s var=""
f  s var=var_"%" q:$L(var)>10  d  ;
. w !,var
;Let's call back to our ^TEMPS global from earlier:
; A log of temperatures by date and time
s ^TEMPS("11/12","0600",32)=""
s ^TEMPS("11/12","0600",48)=""
s ^TEMPS("11/12","1400",49)=""
s ^TEMPS("11/12","1700",43)=""
; Some more
s ^TEMPS("11/16","0300",27)=""
s ^TEMPS("11/16","1130",32)=""
s ^TEMPS("11/16","1300",47)=""

;Here's a loop to print out all the dates we have temperatures for:
n date,time ; Initialize these variables with ""

; This line reads: forever; set date as the next date in ^TEMPS.
; If date was set to "", it means we're at the end, so quit.
; Do the block below
f  s date=$ORDER(^TEMPS(date)) q:date="" d
. w !,date

; Add in times too:
f  s date=$ORDER(^TEMPS(date)) q:date=""  d
. w !,"Date: ",date
. f  s time=$O(^TEMPS(date,time)) q:time=""  d
. . w !,"Time: ",time

; Build an index that sorts first by temperature -
; what dates and times had a given temperature?
n date,time,temp
f  s date=$ORDER(^TEMPS(date)) q:date=""  d
. f  s time=$O(^TEMPS(date,time)) q:time=""  d
. . f  s temp=$O(^TEMPS(date,time,temp)) q:temp=""  d
. . . s ^TEMPINDEX(temp,date,time)=""

;This will produce a global like
^TEMPINDEX(27,"11/16","0300")
^TEMPINDEX(32,"11/12","0600")
^TEMPINDEX(32,"11/16","1130")
