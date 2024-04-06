
// O básico da API de AMD consiste de nada mais que dois métodos: `define` e `require`
// e isso é tudo sobre a definição de módulo e consumo:
// `define(id?, dependências?, factory)` define um módulo
// `require(dependências, callback)` importa uma série de dependências e
// consome elas no callback passado como parâmetro.

// Vamos começar usando o define para definir um novo módulo
// que não tem dependências. Nós vamos fazer isso passando um nome
// e uma função factory para definir:
define('awesomeAMD', function(){
  var isAMDAwesome = function(){
    return true;
  };
  // O valor retornado da função de factory do módulo é
  // o que os outros módulos ou chamadas de require irão
  // receber quando requisitarem nosso módulo `awesomeAMD`.
  // O valor exportado pode ser qualquer coisa, (construtor) funções,
  // objetos, primitives, até mesmo undefined (apesar de que não irão ajudar muito).
  return isAMDAwesome;
});

// Agora, vamos definir outro módulo que depende do nosso módulo `awesomeAMD`.
// Perceba que existe um argumento adicional definindo nossas dependências do
// módulo agora:
define('loudmouth', ['awesomeAMD'], function(awesomeAMD){
  // dependências serão passadas como argumentos da factory
  // na ordem que elas forem especificadas
  var tellEveryone = function(){
    if (awesomeAMD()){
      alert('Isso é tãaaao loko!');
    } else {
      alert('Bem estúpido, né não?');
    }
  };
  return tellEveryone;
});

// Agora que nós sabemos como usar o define, vamos usar o `require` para
// começar nosso programa. A assinatura do `require` é `(arrayDedependências, callback)`.
require(['loudmouth'], function(loudmouth){
  loudmouth();
});

// Para fazer esse tutorial executável, vamos implementar uma versão muito básica
// (não-assíncrona) de AMD bem aqui nesse lugar:
function define(nome, deps, factory){
  // perceba como os módulos sem dependências são manipulados
  define[nome] = require(factory ? deps : [], factory || deps);
}

function require(deps, callback){
  var args = [];
  // primeiro vamos recuperar todas as dependências necessárias
  // pela chamada requerida
  for (var i = 0; i < deps.length; i++){
    args[i] = define[deps[i]];
  }
  // corresponder todas as dependências da função de callback
  return callback.apply(null, args);
}
// você pode ver esse código em ação aqui: http://jsfiddle.net/qap949pd/

/* file: app/main.js */
require(['modules/algumaClasse'], function(AlgumaClasse){
  // o callback é deferido até que a dependencia seja carregada
  var coisa = new AlgumaClasse();
});
console.log('Então aqui estamos nós, esperando!'); // isso vai rodar primeiro

/* arquivo: app/modules/algumaClasse.js */
define(['daos/coisas', 'modules/algunsHelpers'], function(coisasDao, helpers){
  // definição de módulo, claro, irá acontecer também de forma assíncrona
  function AlgumaClasse(){
    this.metodo = function(){/**/};
    // ...
  }
  return AlgumaClasse;
});

/* arquivo: main.js */
requirejs.config({
  baseUrl : 'app',
  paths : {
    // você pode também carregar módulos de outros locais
    jquery : '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min',
    coolLibFromBower : '../bower_components/cool-lib/coollib'
  }
});
require(['jquery', 'coolLibFromBower', 'modules/algunsHelpers'], function($, coolLib, helpers){
  // um arquivo `main` precisa chamar o require pelo menos uma vez,
  // caso contrário, o código jamais rodará
  coolLib.facaAlgoDoidoCom(helpers.transform($('#foo')));
});

<!DOCTYPE html>
<html>
<head>
  <title>Umas 100 tags de script? Nunca mais!</title>
</head>
<body>
  <script src="require.js" data-main="app/main"></script>
</body>
</html>

$ npm install requirejs -g

$ r.js -o app.build.js

/* file : app.build.js */
({
  name : 'main', // nome do ponto de acesso
  out : 'main-built.js', // nome o arquivo para gravar a saída
  baseUrl : 'app',
  paths : {
    // `empty:` fala para o r.js que isso ainda deve ser baixado da CDN, usando
    // o local especificado no `main.js`
    jquery : 'empty:',
    coolLibFromBower : '../bower_components/cool-lib/coollib'
  }
})

<script src="require.js" data-main="app/main-built"></script>

