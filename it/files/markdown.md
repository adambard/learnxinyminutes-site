<!-- Questo significa che possiamo usare elementi di HTML in Markdown, come per esempio i commenti,
e questi non saranno modificati dal parser di Markdown. State attenti però,
se inserite un elemento HTML nel vostro file Markdown, non potrete usare la sua sintassi
all'interno del contenuto dell'elemento. -->
# Questo è un <h1>
## Questo è un <h2>
### Questo è un <h3>
#### Questo è un <h4>
##### Questo è un <h5>
###### Questo è un <h6>
Questo è un h1
==============

Questo è un h2
--------------
*Questo testo è in corsivo.*
_Come pure questo._

**Questo testo è in grassetto.**
__Come pure questo.__

***Questo testo è stilizzato in entrabmi i modi.***
**_Come questo!_**
*__E questo!__*
~~Questo testo è barrato.~~
I paragrafi sono una o più linee di testo adiacenti separate da una o più righe vuote.

Questo è un paragrafo. Sto scrivendo in un paragrafo, non è divertente?

Ora sono nel paragrafo 2.
Anche questa linea è nel paragrafo 2!


Qui siamo nel paragrafo 3!
Questa frase finisce con due spazi (evidenziatemi per vederli).  

C'è un <br /> sopra di me!
> Questa è una citazione. Potete
> mandare a capo manualmente le linee e inserire un `>` prima di ognuna, oppure potete usare una sola linea e lasciare che vada a capo automaticamente.
> Non c'è alcuna differenza, basta che iniziate ogni riga con `>`.

> Potete utilizzare anche più di un livello
>>  di indentazione!
> Quanto è comodo?
* Oggetto
* Oggetto
* Altro oggetto

oppure

+ Oggetto
+ Oggetto
+ Un altro oggetto

oppure

- Oggetto
- Oggetto
- Un ultimo oggetto
1. Primo oggetto
2. Secondo oggetto
3. Terzo oggetto
1. Primo oggetto
1. Secondo oggetto
1. Terzo oggetto
1. Primo oggetto
2. Secondo oggetto
3. Terzo oggetto
    * Sotto-oggetto
    * Sotto-oggetto
4. Quarto oggetto
I box senza la 'x' sono checkbox HTML ancora da completare.
- [ ] Primo task da completare.
- [ ] Secondo task che deve essere completato.
Il box subito sotto è una checkbox HTML spuntata.
- [x] Questo task è stato completato.
    Questa è una linea di codice
    Come questa
    my_array.each do |item|
      puts item
    end
Giovanni non sapeva neppure a cosa servisse la funzione `go_to()`!
***
---
- - -
****************
[Cliccami!](http://test.com/)
[Cliccami!](http://test.com/ "Link a Test.com")
[Vai a musica](/music/).
[Apri questo link][link1] per più informazioni!
[Guarda anche questo link][foobar] se ti va.

[link1]: http://test.com/ "Bello!"
[foobar]: http://foobar.biz/ "Va bene!"
[Questo][] è un link.

[Questo]: http://thisisalink.com/
![Questo è il testo alternativo per l'immagine](http://imgur.com/myimage.jpg "Il titolo opzionale")
![Questo è il testo alternativo.][myimage]

[myimage]: relative/urls/cool/image.jpg "Se vi serve un titolo, lo mettete qui"
<http://testwebsite.com/> è equivalente ad
[http://testwebsite.com/](http://testwebsite.com/)
<foo@bar.com>
Voglio inserire *questo testo circondato da asterischi* ma non voglio che venga renderizzato in corsivo, quindi lo inserirò così: \*questo testo è circondato da asterischi\*.
Il tuo computer è crashato? Prova a premere
<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Canc</kbd>
| Col1                 | Col2     | Col3               |
| :------------------- | :------: | -----------------: |
| Allineato a sinistra | Centrato | Allineato a destra |
| blah                 | blah     | blah               |
Col 1 | Col2 | Col3
:-- | :-: | --:
È una cosa orrenda | fatela | finire in fretta
