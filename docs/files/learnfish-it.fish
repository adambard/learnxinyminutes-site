
> fish -v

> fish

> exit

> set -U fish_greeting ""

> bash -c 'echo "Questo testo sarà stampato sul terminale"'

> vim ~/.config/fish/config.fish

> fish_config

> fish_path_add ~/cowsay

> man set

> ls *.fish

> ls ~/images/**.jpg

~/images/nudini/pewdiepie.jpg
~/images/nudini/peppa.jpg
~/images/screenshots/2020-42-69.jpg
~/images/omegalul.jpg

>echo . Qui ci sarà un testo | grep [udense]

>echo Questo\ é\ un\ testo > file.txt

>echo Questa\ è\ una\ riga >> file.txt
>echo Questa\ è\ un'altra\ riga >> file.txt

> echo "La mia home è $HOME"
La mia home è /home/mioutente

> echo 'La mia home è $HOME'
La mia home è $HOME

> echo Lol; echo questo è divertente

> set var lol && echo $var

> if not echo Testo testo, bla bla bla
      echo Altro testo, bla bla  
  end

# Questo è un commento in fish.
# 
# Se esegui un file senza specificare un interprete, 
# cioè il programma che fa girare il tuo script, è necessario per dire alla shell,
# dove l'interprete è posizionato. 
# In fish basta aggiungere questo commento nella prima linea del tuo script:

#!/bin/fish

# Quando esegui lo script tramite, per esempio, fish /path/to/script.fish
# non è necessario, perchè hai specificato fish come interprete

# Cominciamo con le variabili.
# per l'uso interno a un programma, puoi usare la sintassi
set nome = 'La mia variabile'

# Utilizzo...
set -x nome valore
# per esportare, o
set -e nome
# per Eliminare

# una variabile settata con uno spazio non viene inviata come due argomenti, ma come uno solo, come ci si aspetterebbe.
set directoryBella 'Directory Bella'
mkdir $directoryBella

# Questo creerà una sola directory, come ci si aspetterebbe, non due come in bash...
# chi vorrebbe una roba del genere? è UnA FeAtUrE n0n Un BuG...

# puoi anche avere liste in forma di variabili. Questo ha senso, perchè se volessi una variabile che crei due directory, basta dare a mkdir un elenco di nomi di directory.

# puoi anche contare le istanze nella lista con:
count $PATH

# Non solo è tutto fantastico, ma in fish, tutto è anche una lista. 
# $PWD per esempio è una lista di lunghezza 1. 
# Per fare una lista, basta dare al comando set più argomenti:
set list argomento1 argomento2 argomento3

# in questo modo puoi anche inserire qualcosa in una variabile pre-esistente:
set PATH $PATH ~/cowsay/

# Ma, come precedentemente menzionato, abbiamo anche un'altro modo più semplice per farlo, specialmente in fish.
# Come per ogni Array/Lista, puoi anche accedergli con
$listavar[2]

# ci sono anche gli intervalli
$listavar[1..5]

# puoi anche usare numeri negativi 
$listavar[-1]
# accesso all'ultimo elemento.

# Quando combini due liste di variabili puoi anche usare un bel prodotto cartesiano::
set a 1 2 3
set 1 a b c
echo $a$1
# Restituirà : 1a 2a 3a 1b 2b 3b 1c 2c 3c

# Naturalmente, se li si separa, saranno visti come due argomenti separati e li stamperà uno dopo l'altro. QUESTO è il comportamento che ci si aspetta da @bash.

# Ci sono anche altre cose utili, come la sostituzione di comandi. Per esempio, quando vuoi che ti sia restituito l'output di due comandi in una sola riga. In bash lo faresti in questo modo
echo "`ls` è in $PWD" 
# oppure
echo "$(ls) è in $PWD" 

# secondo me, non è necessario. Scrivo sempre l'apostrofo sbagliato. Perchè non usare semplicemente le parentesi, come in fish?
echo (ls) è in $PWD

# Yep, è facile. E grazie all'highlighting di fish lo puoi vedere istantaneamente, se lo scrivi correttamente.

# E, come ci si aspetterebbe, a mio avviso, i comandi non funzionano tra virgolette. Voglio dire, perchè bash? Ok adesso la smetto. Ma in fish, basta fare:
echo (ls)" è in $PWD"
# oppure
set miavar "Il file"(ls -a)" è nella directory $PWD"
# creerà una lista con la stringa e tutti i file. Prova. Non è una figata?

# E per semparare le variabili in diversi argomenti, basta mettere uno spazio:

set miavar "I file" (ls -a) " sono nella directory $PWD"

# Ci sono anche if, else if, else
if grep fish /etc/shells
    echo Trovato fish
else if grep bash /etc/shells
    echo Trovato bash
else
    echo Non ho trovato niente
end

# Risulta un pò strano confrontare due cose con un solo segno =, ovviamente perchè non en abbiamo bisogno per settare le variabili, ma comunque... e la parola chiave "test":
if test $var = "test"
    echo si 
else 
    echo no
end

# Naturalmente, ci sono anche gli switch case
switch $OS
case Linux
    echo "Sei un grande"
case Windows
    echo "Potresti provare fish su WSL"
case MacOS
    echo "Su MacOS c'è fish!"
case '*'
    echo "quale OS è $OS, per favore?"
end


# le funzioni in fish prendono gli argomenti attraverso la variabile $argv. La sintassi è la seguente:

function stampa
    echo $argv
end

# Ci sono anche gli eventi, come l'evento "fish_exit" (Cosa farà mai, hmm?).

# Puoi usarli aggiungendoli alle definizioni di funzione:

function in_uscita --on-event fish_exit
    echo fish si sta chiuendo
end

# trova gli eventi con il comando
functions --handlers


# Puoi usare il comando functions per approfondire, beh, le funzioni. 
# Per esempio puoi far stampare il codice sorgente di ogni funzione:
functions cd
functions print
# oppure ottenere il nome di ogni funzione:
functions

# Ci sono i cicli while, ovviamente
while test $var = lol
    echo lol
end

# Cicli for (con le wildcards, sono ancora meglio):
for immagine in *.jpg
    echo $immagine
end

# c'è un equivalente di range(0, 5) in Python, quindi puoi anche fare il classico ciclo for con i numeri:

set files (ls)
for numeri in (seq 10)
    echo "$files[$numeri] è il file numero $numeri"
end

# Bello!

# L'equivalente di bashrc non è fishrc, ma il già citato file config.fish in ~/.config/fish/
# Per aggiungere una funzione a fish, però, occorre creare un semplice file .fish in quella directory. Non incollare la funzione nel file config.fish. È brutto. 
# Se avete altro da dire, aggiugete pure, ma queste sono le basi più importanti.

