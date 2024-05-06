
$ easy_install docutils

$ pip install docutils

.. Zeilen, die mit zwei Punkten starten sind spezielle Befehle. 

.. Wenn kein Befehl gefunden wird, wird die Zeile als Kommentar gewertet. 

============================================================================
Haupttitel werden mit Gleichheitszeichen darüber und darunter gekennzeichnet
============================================================================

Beachte das es genau so viele Gleichheitszeichen, wie Hauptitelzeichen
geben muss.

Titel werden auch mit Gleichheitszeichen unterstrichen
======================================================

Untertitel werden mit Strichen gekennzeichnet
---------------------------------------------

Text in *kursiv* oder in **fett**. Du kannst Text als Code "markieren", wenn
du doppelte Backquotes verwendest ``: ``print()``.

Listen sind so einfach wie in Markdown:

- Erstes Element
- Zweites Element
    - Unterelement

oder

* Erstes Element
* Zweites Element
    * Unterelement

Tabellen sind einfach zu schreiben:

=========== ==========
Land        Hauptstadt 
=========== ==========
Frankreich  Paris
Japan       Tokyo
=========== ========

Komplexere Tabellen (zusammengeführte Spalten und Zeilen) können einfach 
erstellt werden, aber ich empfehle dir dafür die komplette Dokumentation zu lesen :)

Es gibt mehrere Möglichkeiten um Links zu machen:

- Wenn man einen Unterstrich hinter einem Wort hinzufügt: GitHub_ Zusätzlich 
muss man die Zielurl nach dem Text hinzufügen. 
(Dies hat den Vorteil, dass man keine unnötigen Urls in lesbaren Text einfügt.
- Wenn man die vollständige Url eingibt: https://github.com/
(Dies wird automatisch in ein Link konvertiert.)
- Wenn man es mehr Markdown ähnlich eingibt: `GitHub <https://github.com/>`_ .

.. _GitHub https://github.com/

$ rst2html myfile.rst output.html

