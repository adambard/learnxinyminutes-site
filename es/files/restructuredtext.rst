$ easy_install docutils
$ pip install docutils
.. Las líneas que empiezan por un punto seguido de otro punto son comandos especiales. Si no se encuentra ningún comando, se considerará que esa línea es un comentario.

========================================================================
Los títulos principales se escriben usando el signo igual arriba y abajo
========================================================================

Observa que cada caracter, incluyendo los espacios, necesita un signo igual por encima y por debajo.

Los títulos de nivel medio también usan el signo igual, pero solo por debajo
=============================================================================


Títulos de nivel más bajo con guiones
-------------------------------------


Puedes poner texto en *cursiva* o en **negrita.**  También puedes "marcar" texto como código usando la doble comilla inversa, como ``print()``.

Los caracteres especiales pueden "escaparse" usando el backslash, como \\ o \*.

Las listas son similares a las de Markdown, pero un poquito más sofisticadas.

Recuerda alinear los símbolos de lista (como - o \*) al margen izquierdo del anterior bloque de texto. Recuerda también usar líneas en blanco para separar listas nuevas de las listas padre:


- Primer elemento
- Segundo elemento

  - Subelemento

- Tercer elemento

o

* Primer elemento
* Segundo elemento

  * Subelemento

* Tercer elemento

Las tablas son muy fáciles de escribir.

=========== ========
País        Capital
=========== ========
Francia     París
Japón       Tokyo
=========== ========

Se pueden elaborar fácilmente tablas más complejas (con columnas y/o filas fusionadas) pero para esto es recomendable leer el documento completo. :)

Hay varias formas de construir enlaces:

- Añadiendo un guión bajo al final de una palabra: GitHub_ y poniendo despues del texto la URL (esto tiene la ventaja de no insertar URLs innecesarias en el texto visible)
- Tecleando un URL completa :  https://github.com/ (se convertirá automáticamente en enlace)
- Creando un link al estilo Markdown: `GitHub <https://github.com/>`_ .

.. _GitHub: https://github.com/
$ rst2html myfile.rst output.html
