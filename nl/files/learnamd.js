// De basis AMD API bestaat uit niks meer dan twee methodes: `define` en `require`
// and gaat vooral over de definitie en gebruik van modules:
// `define(id?, dependencies?, factory)` definieert een module
// `require(dependencies, callback)` importeert een set van dependencies en
// gebruikt ze in de gegeven callback

// Laten we starten met het gebruiken van define om een nieuwe module (met naam)
// te creëeren, welke geen dependencies heeft. Dit doen we door een naam
// en een zogeheten factory functie door te geven aan define:
define('awesomeAMD', function(){
  var isAMDAwesome = function(){
    return true;
  };
  // De return waarde van een module's factory functie is
  // wat andere modules of require calls ontvangen wanneer
  // ze onze `awesomeAMD` module requiren.
  // De geëxporteerde waarde kan van alles zijn: (constructor) functies,
  // objecten, primitives, zelfs undefined (hoewel dat niet veel nut heeft).
  return isAMDAwesome;
});


// We gaan nu een andere module defineren die afhankelijk is van onze
// `awesomeAMD` module. Merk hierbij op dat er nu een extra functieargument
// is die de dependencies van onze module defineert:
define('schreewlelijk', ['awesomeAMD'], function(awesomeAMD){
  // dependencies worden naar de factory's functieargumenten
  // gestuurd in de volgorde waarin ze gespecificeert zijn
  var vertelIedereen = function(){
    if (awesomeAMD()){
      alert('Dit is zOoOo cool!');
    } else {
      alert('Vrij saai, niet?');
    }
  };
  return vertelIedereen;
});

// Nu we weten hoe we define moeten gebruiken, kunnen we require gebruiken
// om ons programma mee te starten. De vorm van `require` is
// `(arrayVanDependencies, callback)`.
require(['schreeuwlelijk'], function(schreewlelijk){
  schreeuwlelijk();
});

// Om deze tutorial code uit te laten voeren, gaan we hier een vrij basic
// (niet-asynchrone) versie van AMD implementeren:
function define(naam, deps, factory){
  // merk op hoe modules zonder dependencies worden afgehandeld
  define[naam] = require(factory ? deps : [], factory || deps);
}

function require(deps, callback){
  var args = [];
  // we halen eerst alle dependecies op die nodig zijn
  // om require aan te roepen
  for (var i = 0; i < deps.length; i++){
    args[i] = define[deps[i]];
  }
  // voldoe aan alle dependencies van de callback
  return callback.apply(null, args);
}
// je kan deze code hier in actie zien (Engels): http://jsfiddle.net/qap949pd/
/* file: app/main.js */
require(['modules/someClass'], function(SomeClass){
  // de callback word uitgesteld tot de dependency geladen is
  var things = new SomeClass();
});
console.log('Dus, hier wachten we!'); // dit wordt als eerste uitgevoerd
/* file: app/modules/someClass.js */
define(['daos/things', 'modules/someHelpers'], function(thingsDao, helpers){
  // definitie van de module gebeurt, natuurlijk, ook asynchroon
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
    // je kan ook modules uit andere locatie inladen
    jquery : '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min',
    coolLibUitBower : '../bower_components/cool-lib/coollib'
  }
});
require(['jquery', 'coolLibUitBower', 'modules/someHelpers'], function($, coolLib, helpers){
  // een `main` bestand moet require minstens eenmaal aanroepen,
  // anders zal er geen code uitgevoerd worden
  coolLib.doFancyDingenMet(helpers.transform($('#foo')));
});
<!DOCTYPE html>
<html>
<head>
  <title>Honder script tags? Nooi meer!</title>
</head>
<body>
  <script src="require.js" data-main="app/main"></script>
</body>
</html>
$ npm install requirejs -g
$ r.js -o app.build.js
/* file : app.build.js */
({
  name : 'main', // naam van het beginpunt
  out : 'main-built.js', // naam van het bestand waar de output naar geschreven wordt
  baseUrl : 'app',
  paths : {
    // `empty:` verteld r.js dat dee nog steeds geladen moet worden van de CDN,
    // gebruik makend van de locatie gespecificeert in `main.js`
    jquery : 'empty:',
    coolLibUitBower : '../bower_components/cool-lib/coollib'
  }
})
<script src="require.js" data-main="app/main-built"></script>
