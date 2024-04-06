
$ easy_install docutils

$ pip install docutils

.. Le righe che iniziano con due punti sono comandi speciali. Ma se non è possibile trovare alcun comando, la riga viene considerata come un commento

===============================================================================
I titoli principali sono scritti utilizzando caratteri di uguale, sopra e sotto
===============================================================================

Si noti che devono esserci tanti caratteri di uguale quanti caratteri del titolo.

Anche i titoli normali usano caratteri di uguale, ma solo sotto
===============================================================

I sottotitoli usano i trattini
------------------------------

E i sotto-sottotitoli le tildi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Puoi inserire il testo in *corsivo* o in **grassetto**, puoi "contrassegnare" il testo come codice con un doppio apice ``: `` print () ``.

Le liste sono semplici come in Markdown:

- primo articolo
- Secondo elemento
     - Sottoelemento

oppure

* Primo elemento
* Secondo elemento
     * Sottoelemento

Le tabelle sono molto semplici da inserire:

=========== ========
Stato       Capitale
=========== ========
Francia     Parigi
Giappone    Tokio
=========== ========

Anche le tabelle più complesse possono essere inserite facilmente (colonne e/o righe unite) ma ti suggerisco di leggere la documentazione completa per questo :)

Esistono diversi modi per creare collegamenti:

- Aggiungendo un underscore dopo una parola: GitHub_ e aggiungendo l'URL di destinazione dopo il testo (questo metodo ha il vantaggio di non inserire URL non necessari all'interno del testo leggibile).
- Digitando un URL completo: https://github.com/ (verrà automaticamente convertito in un collegamento)
- Utilizzando una sintassi simile a Markdown: `GitHub <https://github.com/>`_ .

.. _GitHub https://github.com/

$ rst2html miofile.rst output.html

