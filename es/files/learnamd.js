// El API básico de AMD consiste en tan solo dos métodos: `define` y `require`
// y se basa en la definición y consumo de los módulos:
// `define(id?, dependencias?, fábrica)` define un módulo
// `require(dependencias, callback)` importa un conjunto de dependencias y
// las consume al invocar el callback

// Comencemos usando define para definir un nuevo módulo
// que no posee dependencias. Lo haremos enviando un nombre
// y una función fábrica para definirla:
define('awesomeAMD', function(){
  var isAMDAwesome = function(){
    return true;
  };
  // El valor que regresa la función fábrica del módulo será
  // lo que los otros módulos o llamados require recibirán cuando
  // soliciten nuestro módulo `awesomeAMD`.
  // El valor exportado puede ser cualquier cosa, funciones (constructores),
  // objetos, primitivos, incluso indefinidos (aunque eso no ayuda mucho).
  return isAMDAwesome;
});

// Ahora definamos otro módulo que dependa de nuestro módulo `awesomeAMD`.
// Observe que ahora hay un argumento adicional que define 
// las dependencias de nuestro módulo:
define('loudmouth', ['awesomeAMD'], function(awesomeAMD){
  // las dependencias serán enviadas a los argumentos de la fábrica
  // en el orden que sean especificadas
  var tellEveryone = function(){
    if (awesomeAMD()){
      alert('This is sOoOo rad!');
    } else {
      alert('Pretty dull, isn\'t it?');
    }
  };
  return tellEveryone;
});

// Como ya sabemos utilizar define usemos ahora `require` para poner en marcha
//  nuestro programa. La firma de `require` es `(arrayOfDependencies, callback)`.
require(['loudmouth'], function(loudmouth){
  loudmouth();
});

// Para hacer que este tutorial corra código, vamos a implementar una
// versión muy básica (no-asíncrona) de AMD justo aquí:
function define(name, deps, factory){
  // observa como son manejados los módulos sin dependencias
  define[name] = require(factory ? deps : [], factory || deps);
}

function require(deps, callback){
  var args = [];
  // primero recuperemos todas las dependencias que necesita
  // el llamado require
  for (var i = 0; i < deps.length; i++){
    args[i] = define[deps[i]];
  }
  // satisfacer todas las dependencias del callback
  return callback.apply(null, args);
}
// puedes ver este código en acción aquí: http://jsfiddle.net/qap949pd/
/* file: app/main.js */
require(['modules/someClass'], function(SomeClass){
  // el callback es diferido hasta que la dependencia sea cargada
  var thing = new SomeClass();
});
console.log('So here we are, waiting!'); // esto correrá primero
/* file: app/modules/someClass.js */
define(['daos/things', 'modules/someHelpers'], function(thingsDao, helpers){
  // definición de módulo, por supuesto, ocurrirá también asincrónicamente
  function SomeClass(){
    this.method = function(){/**/};
    // ...
  }
  return SomeClass;
});
/* file: main.js */
requirejs.config({
  baseUrl : 'app',
  paths : {
    // también puedes cargar módulos desde otras ubicaciones
    jquery : '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min',
    coolLibFromBower : '../bower_components/cool-lib/coollib'
  }
});
require(['jquery', 'coolLibFromBower', 'modules/someHelpers'], function($, coolLib, helpers){
  // un fichero `main` necesita llamar a require al menos una vez,
  // de otra forma jamás correrá el código
  coolLib.doFancyStuffWith(helpers.transform($('#foo')));
});
<!DOCTYPE html>
<html>
<head>
  <title>Cien etiquetas de script? Nunca más!</title>
</head>
<body>
  <script src="require.js" data-main="app/main"></script>
</body>
</html>
$ npm install requirejs -g
$ r.js -o app.build.js
/* file : app.build.js */
({
  name : 'main', // nombre del punto de entrada
  out : 'main-built.js', // nombre del fichero donde se escribirá la salida
  baseUrl : 'app',
  paths : {
    // `empty:` le dice a r.js que esto aún debe ser cargado desde el CDN, usando
    // la ubicación especificada en `main.js`
    jquery : 'empty:',
    coolLibFromBower : '../bower_components/cool-lib/coollib'
  }
})
<script src="require.js" data-main="app/main-built"></script>
