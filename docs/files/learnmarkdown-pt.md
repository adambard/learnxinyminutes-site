
<!--Isso significa que nós podemos usar elementos HTML em Markdown, como o
elemento de comentário, e eles não serão afetados pelo analisador de
remarcação. No entanto, se você criar um elemento HTML em seu arquivo Markdown,
você não pode usar sintaxe de remarcação dentro do conteúdo desse elemento.-->

# Isto é um cabeçalho <h1>
## Isto é um cabeçalho <h2>
### Isto é um cabeçalho <h3>
#### Isto é um cabeçalho <h4>
##### Isto é um cabeçalho <h5>
###### Isto é um cabeçalho <h6>

Isto é um cabeçalho h1
======================

Isto é um cabeçalho h2
----------------------

*Este texto está em itálico*
_E este também está._

**Este texto está em negrito**
__E este também está.__

***Este texto está em negrito e itálico.***
**_E este também está_**
*__Danou-se! Este também__*

~~Este texto é processado com tachado.~~

Este é um parágrafo. Eu estou digitando em um parágrafo, não é legal?

Agora, eu estou no parágrafo 2.
Ainda continuo no parágrafo 2!


Eu estou no parágrafo três!

Termino com dois espaços (selecione essa linha para vê-los). 

Há um <br /> acima de mim!

> Este é um bloco de citação. Você pode 
> Quebrar manualmente suas linhas e colocar um `>` antes de cada linha ou você
> pode deixar suas linhas ficarem muito longas e quebrarem por conta própria.
> Não faz diferença, desde que elas comecem com um `>`.

> Você também pode usar mais de um nível 
>> De recuo?
> O quão legal é isso?


* Item
* Item
* Outro item

ou

+ Item
+ Item
+ Outro item

ou

- Item
- Item
- Um último item

1. Item um
2. Item dois
3. Item três

1. Item um
1. Item dois
1. Item três

1. Item um
2. Item dois
3. Item três
    * Sub-item
    * Sub-item
4. Item quatro

As caixas abaixo sem o 'x' são checkboxes HTML desmarcadas.
- [ ] Primeira tarefa a completar.
- [ ] Segunda tarefa a completar
A caixa de seleção abaixo será exibida como uma checkbox HTML marcada.
- [x] Essa tarefa foi completa

    Isto é código
    É assim, sacou?

    my_array.each do |item|
      puts item
    end

John não sabia nem o que a função `go_to()` fazia!



***
---
- - - 
****************

[Clique aqui!](http://test.com/)

[Cliqueaqui!](http://test.com/ "Link para Test.com")

[Ir para música](/música/).

[Clique nesse link][link1] para mais informações!
[Também cheque esse link][foobar] se você quiser.

[link1]: http://test.com/ "Legal!"
[link2r]: http://foobar.biz/ "Certo!"

[Isso][] é um link.

[Isso]: http://thisisalink.com/

- [Cabeçalho](#cabecalho)
- [Um outro cabeçalho](#outro-cabecalho)
- [Capítulo](#capitulo)
  - [Subcapítulo <h3 />](#subcapitulo-h3-)

![Este é alt-text (texto alternativo) para minha imagem](http://imgur.com/myimage.jpg "Um título opcional") 

![Esse é o alt-attribute.][myimage]

[Minha imagem]: relative/urls/cool/image.jpg "se precisar de um título, está aqui"

<http://testwebsite.com/> é equivalente a 
[http://testwebsite.com/](http://testwebsite.com/) 

<foo@bar.com> 

Seu computador travou? Tente apertar
<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Del</kbd>

| Col1         | Col2     | Col3          |
| :----------- | :------: | ------------: |
| esquerda-alin| Centrado | direita-alinh |
| blah         | blah     | blah          |

Col 1 | Col2 | Col3
:-- | :-: | --:
Ugh isso é tão feio | faça isto | parar

