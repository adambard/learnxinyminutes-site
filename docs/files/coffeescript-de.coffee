
# CoffeeScript ist eine dieser Sprachen für "Hipster"
# und folgt daher vielen Trends und Einflüssen aus modernen Sprachen.
# Kommentare werden daher wie in Ruby und Python mit Hashes gekennzeichnet

###
Kommentarblöcke sehen aus wie diese und werden direkt nach '/ *'s und '* /'s
im erzeugten JavaScript umgewandelt.

Vorweg: bevor du mit CoffeeScript anfängst, solltest du bereits einen guten
Überblick über die Sprache JavaScript haben.
###

# Zuweisung:
number   = 42 #=> var number = 42;
opposite = true #=> var opposite = true;

# Bedingungen:
number = -42 if opposite #=> if(opposite) { number = -42; }

# Funktionen:
square = (x) -> x * x #=> var square = function(x) { return x * x; }

fill = (container, liquid = "Kaffee") ->
  "#{container} wird mit #{liquid} gefüllt..."
#=>var fill;
#
#fill = function(container, liquid) {
#  if (liquid == null) {
#    liquid = "Kaffee";
#  }
#  return container + " wird mit " + liquid + " gefüllt...";
#};

# "Ranges":
list = [1..5] #=> var list = [1, 2, 3, 4, 5];

# Objekte:
math =
  root:   Math.sqrt
  square: square
  cube:   (x) -> x * square x
#=> var math = {
#  "root": Math.sqrt,
#  "square": square,
#  "cube": function(x) { return x * square(x); }
#}

# "Splats":
race = (winner, runners...) ->
  print winner, runners
#=>race = function() {
#  var runners, winner;
#  winner = arguments[0], runners = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
#  return print(winner, runners);
#};

# Existenz-Operator:
alert "Hab ich's nicht gesagt?" if elvis?
#=> if(typeof elvis !== "undefined" && elvis !== null) { alert("Hab ich's nicht gesagt?"); }

# Listen-Abstraktion:
cubes = (math.cube num for num in list)
#=>cubes = (function() {
#	var _i, _len, _results;
#	_results = [];
# 	for (_i = 0, _len = list.length; _i < _len; _i++) {
#		num = list[_i];
#		_results.push(math.cube(num));
#	}
#	return _results;
#  })();

foods = ['Brokkoli', 'Spinat', 'Schokolade']
eat food for food in foods when food isnt 'Schokolade'
#=>foods = ['Brokkoli', 'Spinat', 'Schokolade'];
#
#for (_k = 0, _len2 = foods.length; _k < _len2; _k++) {
#  food = foods[_k];
#  if (food !== 'Schokolade') {
#    eat(food);
#  }
#}

