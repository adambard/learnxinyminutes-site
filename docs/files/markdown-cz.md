
<!-- To znamená, že v Markdownu můžeme používat HTML elementy jako například 
komentáře, které nebudou ovlivněny parserem Markdownu. Na druhou stranu to také 
znamená, že pokud ve svém Markdown kódu vytvoříte HTML element, už v rámci 
tohoto elementu nelze použít Markdown. 

Markdown využívá i tato stránka, a tak by tento text, kdyby nebyl obalen v bloku 
kódu (viz níže), jako validní HTML komentář vůbec nebyl vidět. -->

# Toto je <h1>
## Toto je <h2>
### Toto je <h3>
#### Toto je <h4>
##### Toto je <h5>
###### Toto je <h6>

Toto je h1
==========

Toto je h2
----------

*Tento text je kurzívou;*
_Stejně jako tento._

**Tento text je tučně**
__Stejně jako tento.__

***Tento text je obojí***
**_Tak jako tento!_**
*__Nebo tento!__*

~~Tento text je přeškrtnutý.~~

Toto je odstavec. Zde jsem napsal odstavec a je to bezva!

Teď jsem v odstavci 2.
A tady jsem pořád v odstavci 2!

Ale tady už je odstavec 3.

Tento odstavec končí dvěma mezerami.  

Nad tímto odstavcem je <br />!

> Toto je bloková citace. Můžete dokonce
> manuálně rozdělit řádky, a před každý vložit >, nebo nechat vaše řádky 
> jakkoli dlouhé, ať se zarovnají samy.
> Je to jedno, pokud vždy začínají symbolem `>`.

> Použít můžu i více než jednu úroveň
>> odsazení.
> Co vy na to?

* Položka
* Položka
* Jiná položka

nebo

+ Položka
+ Položka
+ Další položka

nebo

- Položka
- Položka
- Další položka

1. Položka jedna
2. Položka dvě
3. Položka tři

<!-- Čísla ani nemusíte psát popořadě. Markdown je umí zobrazit správně, jenom 
je třeba vždy překontrolovat, že číslování funguje správně. -->

1. Položka jedna
1. Položka dvě
1. Položka tři

<!-- (Toto zobrazí to samé, jako příklad nad tím.) -->

1. Položka jedna
2. Položka dvě
3. Položka tři
    - Podpoložka
    - Podpoložka
4. Položka čtyři

- [ ] První úkol, který je třeba dokončit
- [ ] Druhý úkol na dodělání
Tento box bude zaškrtnutý
- [x] Tento úkol byl dokončen

    Toto je kód
    Stejně jako toto

    moje_pole.each do |i|
      puts i
    end

Honza neměl tušení, co dělá funkce `go_to()`!



***
---
- - -
****************

<!-- Jedna z nejlepších vlastností Markdownu je, jak snadno lze s jeho pomocí 
vytvářet odkazy. Text odkazu, který chcete zobrazit vložte do [] a hned za něj 
v kulatých závorkách () připojte url adresu. -->

[Klikni na mě!](http://test.com/)


<!-- V uvozovkách za url můžete přidat název odkazu -->

[Klikni na mě!](http://test.com/ "Odkaz na Test.com")


<!-- Relativní cesty fungují také -->

[Jdi na hudbu](/hudba/).


<!-- Markdown taktéž podporuje referenční odkazy -->

[Klikni na tento odkaz][link1] pro více informací!
[Taky zkontrolujte tento odkaz][neco], jestli tedy chcete.

[link1]: http://test.com/ "Cool!"
[neco]: http://neco.czz/ "Dobře!"

<!-- Titulek v tomto případě může být v jednoduchých uvozovkách, závorkách, nebo 
zcela vynechaný. Reference může být kdekoliv ve vašem dokumentu a identifikátory 
mohou být jakékoli, pokud jsou unikátní. -->


<!-- V markdownu existuje rovněž "implicitní pojmenování", které použije text 
odkazu jako své id -->

[Toto][] je odkaz..

[toto]: http://totojelink.cz/

<!-- Ale tento způsob se obvykle nepoužívá. -->

- [Nadpis](#nadpis)
- [Víceslovný text](#víceslovný-text)
- [Odstavce](#odstavce)
  - [Podkapitola <h3 />](#podkapitola-h3-)

<!-- Obrázky se vytváří stejně jako odkazy, ale s vykřičníkem na začátku -->

![Toto je atribut alt pro obrázek](http://imgur.com/myimage.jpg "Nepovinný titulek")

<!-- Reference fungují tak, jak bychom čekali -->

![Toto je atribut alt][mujobrazek]

[mujobrazek]: relativni/cesta/obrazek.jpg "a toto by byl titulek"

<http://stranka.cz/> 

je stejné jako

[http://stranka.cz/](http://stranka.cz/)

<jmeno@prijmeni.cz>

Chci napsat *tento text obklopený hvězdičkami*, ale protože nechci, aby to bylo 
kurzívou, tak hvězdičky vyescapuji `\`: \*tento text bude obklopený hvězdičkami\*.

<!-- V Markdownu od GitHubu můžete použít tag <kbd> k označení kláves na 
počítači -->

Váš počítač přestal pracovat? Zkuste
<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Del</kbd>

| Sloupec1     | Sloupec2 | Sloupec3      |
| :----------- | :------: | ------------: |
| Vlevo zarovn.| Na střed | Vpravo zarovn.|
| blah         | blah     | blah          |

<!-- nebo je jde taky zapsat takto: -->

Sloupec 1 | Sloupec2 | Sloupec3
:-- | :-: | --:
Že se to nedá číst? | No tak to takhle | radši nedělejte.

