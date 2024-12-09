<!-- Ce qui veut dire que vous pouvez utiliser des balises HTML dans un fichier
Markdown, comme la balise commentaire dans laquelle nous sommes à présent, car
celle-ci ne sera pas affectée par l'analyseur syntaxique du Markdown.
Toutefois, si vous voulez créer une balise HTML dans un fichier Markdown,
vous ne pourrez pas utiliser du Markdown à l'intérieur de cette derniere. -->
# Ceci est un <h1>
## Ceci est un <h2>
### Ceci est un <h3>
#### Ceci est un <h4>
##### Ceci est un <h5>
###### Ceci est un <h6>
Ceci est un h1
=============

Ceci est un h2
-------------
*Ce texte est en italique.*
_Celui-ci aussi._

**Ce texte est en gras.**
__Celui-là aussi.__

***Ce texte a les deux styles.***
**_Pareil ici_**
*__Et là!__*
~~Ce texte est barré.~~
Ceci est un paragraphe. Là, je suis dans un paragraphe, facile non?

Maintenant je suis dans le paragraphe 2.
Je suis toujours dans le paragraphe 2!


Puis là, eh oui, le paragraphe 3!
J'ai deux espaces vides à la fin (sélectionnez moi pour les voir).  

Bigre, il y a un <br /> au dessus de moi!
> Ceci est une superbe citation. Vous pouvez même
> revenir à la ligne quand ça vous chante, et placer un `>`
> devant chaque bout de ligne faisant partie
> de la citation.
> La taille ne compte pas^^ tant que chaque ligne commence par un `>`.

> Vous pouvez aussi utiliser plus d'un niveau
>> d'imbrication!
> Classe et facile, pas vrai?
* Item
* Item
* Un autre item
+ Item
+ Item
+ Encore un item
- Item
- Item
- Un dernier item
1. Item un
2. Item deux
3. Item trois
1. Item un
1. Item deux
1. Item trois
1. Item un
2. Item deux
3. Item trois
   * Sub-item
   * Sub-item
4. Item quatre
Les [ ] ci-dessous, n'ayant pas de [ x ], deviendront des cases à cocher HTML
non-cochées.
- [ ] Première tache à réaliser.
- [ ] Une autre chose à faire.
La case suivante sera une case à cocher HTML cochée.
- [x] Ça ... c'est fait!
    echo "Ça, c'est du Code!";
    var Ça = "aussi !";
    my_array.each do |item|
      puts item
    end
La fonction `run()` ne vous oblige pas à aller courir!
***
---
- - -
****************
[Clic moi!](http://test.com/)
[Clic moi!](http://test.com/ "Lien vers Test.com")
[En avant la musique](/music/).
[Cliquez ici][link1] pour plus d'information!
[Regardez aussi par ici][foobar] si vous voulez.

[link1]: http://test.com/ "Cool!"
[foobar]: http://foobar.biz/ "Génial!"
[Ceci][] est un lien.

[Ceci]:http://ceciestunlien.com/
![Attribut ALT de l'image](http://imgur.com/monimage.jpg "Titre optionnel")
![Ceci est l'attribut ALT de l'image][monimage]

[monimage]: relative/urls/cool/image.jpg "si vous voulez un titre, c'est ici."
<http://testwebsite.com/> est équivalent à :
[http://testwebsite.com/](http://testwebsite.com/)
<foo@bar.com>
Pour taper *ce texte* entouré d'astérisques mais pas en italique :
Tapez \*ce texte\*.
Ton ordinateur a planté? Essayer de taper :
<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Del</kbd>
| Col1              | Col2     | Col3              |
| :---------------- | :------: | ----------------: |
| Alignement Gauche | Centré   | Alignement Droite |
| bla               | bla      | bla               |
Col 1 | Col2 | Col3
:-- | :-: | --:
Ough que c'est moche | svp | arrêtez
