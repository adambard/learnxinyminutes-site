> fish -v
> fish
> exit
> set -U fish_greeting ""
> bash -c 'echo "fish is better than bash"'
> vim ~/.config/fish/config.fish
> fish_config
> fish_add_path ~/cowsay
> man set
> ls *.fish
> ls ~/images/**.jpg

~/images/nudes/pewdiepie.jpg
~/images/nudes/peppa.jpg
~/images/screenshots/2020-42-69.jpg
~/images/omegalul.jpg
>echo sick egg, nadia. no u do really goofy shit.   | grep [udense]
>echo This\ is\ text > file.txt
>echo This\ is\ a\ line >> file.txt
>echo This\ is\ a\ second\ line >> file.txt
> echo "My home is $HOME"
My home is /home/myuser
> echo 'My home is $HOME'
My home is $HOME
> echo Lol; echo this is fun
> set var lol && echo $var
> if not echo It's very late I should not waste my time with this  
      echo Nobody heard you  
  end
# This is a comment in fish.
# 
# If you execute a file without specifying an interpreter, 
# meaning the software that runs your script, you need to tell the shell, 
# where that interpreter is. 
# For fish you just add the following comment as the first line in your script:

#!/bin/fish

# When executing via e.g. fish /path/to/script.fish
# you don't need that, because you specified fish as an interpreter

# Let's start with variables.
# for use inside a program, you can use the syntax
set name 'My Variable'

# Use...
set -x name value
# to eXport, or
set -e name
# to Erase

# a variable set with a space doesn't get sent as two arguments, but as one, as you would expect it. 
set turtlefolder 'Turtle Folder'
mkdir $turtlefolder

# This will create one folder, as expected, not two, like in bash... 
# Who would even want that? tHiS iS a fEaTurE, nOt a bUg...

# you can even have lists as variables. This actually makes sense, because if you want to have a variable that would create two folders, you just give mkdir a list of your foldernames.

# you can then count the entries in that list with:
count $PATH

# Not only is everything awesome, but in fish, everything is also a list. 
# So $PWD for example is a list of length 1. 
# To make a list, just give the set command multiple arguments:
set list entry1 entry2 entry3

# that way you can also append something to an existing variable:
set PATH $PATH ~/cowsay/

# But, as previously mentioned, we also have a simpler way to do that specifically in fish.
# As with every Array/List, you can access it with 
$listvar[2]

# there's also ranges with 
$listvar[1..5]

# and you can use negative numbers like 
$listvar[-1]
# e.g to access the last element.

# You can also do fancy cartesian products when you combine two list variables:
set a 1 2 3
set 1 a b c
echo $a$1
# Will output : 1a 2a 3a 1b 2b 3b 1c 2c 3c

# Of course, if you separate them, it will see them as two separate arguments and echo them one after the other. THAT is expected behavior @bash.

# There are also other useful things, like command substitutions. For example, when you want to output the returns of two commands in one line. In bash you would do that with
echo "`ls` is in $PWD" 
# or 
echo "$(ls) is in $PWD" 

# if you ask me, that's unnecessary. I always type in the wrong apostrophe. Why not just use two parenthesis, like in fish?
echo (ls) is in $PWD

# Yep, that easy. And thanks to fish's highlighting you can instantly see, if you typed it in correctly.

# And, as you would expect, if you ask me, your commands don't work in quotes. I mean why bash? Ok I'll stop now. But in fish, just do:
echo (ls)" is in $PWD"
# or
set myvar "The file"(ls -a)" is in the directory $PWD"
# will make a List with the string and all files. Try it out. Isn't that cool?

# And to separate these variables in separate arguments, just put a space between them:

set myvar "The files" (ls -a) " are in the directory $PWD"

# There's also if, else if, else
if grep fish /etc/shells
    echo Found fish
else if grep bash /etc/shells
    echo Found bash
else
    echo Got nothing
end

# A little weird is that you compare stuff with one = sign, of course because we don't need it to set variables, but still... and the keyword "test":
if test $var = "test"
    echo yes 
else 
    echo no
end

# Of course, there's also switch case with
switch $OS
case Linux
    echo "you're good"
case Windows
    echo "install Gentoo"
case Arch
    echo "I use arch btw"
case '*'
    echo "what OS is $OS, please?"
end


# functions in fish get their arguments through the $argv variable. The syntax is following:

function print
    echo $argv
end

# There are also events, like the "fish_exit"-event (What may that be, hmm?).

# You can use them by adding them to the function definition:

function on_exit --on-event fish_exit
    echo fish is now exiting
end

# find events with the command
functions --handlers


# You can use the functions command to learn more about, well, functions. 
# For example you can print the source code of every function:
functions cd
functions print
# or get the names of all functions:
functions

# There's while Loops, of course
while test $var = lol
    echo lol
end

# for Loops (with wildcards, they are even cooler):
for image in *.jpg
    echo $image
end

# there's an equivalent to the range(0, 5) in Python, so you can also do the standard for loops with numbers:

set files (ls)
for number in (seq 10)
    echo "$files[$number] is file number $number"
end

# Cool!

# The bashrc equivalent is not fishrc, but the previously mentioned config.fish file in ~/.config/fish/
# To add a function to fish, though, you should create a simple .fish file in that directory. Don't just paste that function in the config.fish. That's ugly. 
# If you have more, just add it, but those are the most important basics.
