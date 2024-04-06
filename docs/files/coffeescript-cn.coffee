
# CoffeeScript是一种很潮的编程语言，
# 它紧随众多现代编程语言的趋势。
# 因此正如Ruby和Python，CoffeeScript使用井号标记注释。

###
大段落注释以此为例，可以被直接编译为 '/ *' 和 '* /' 包裹的JavaScript代码。

在继续之前你需要了解JavaScript的基本概念。

示例中 => 后为编译后的JavaScript代码
###

# 赋值:
number   = 42 #=> var number = 42;
opposite = true #=> var opposite = true;

# 条件:
number = -42 if opposite #=> if(opposite) { number = -42; }

# 函数:
square = (x) -> x * x #=> var square = function(x) { return x * x; }

fill = (container, liquid = "coffee") ->
  "Filling the #{container} with #{liquid}..."
#=>var fill;
#
#fill = function(container, liquid) {
#  if (liquid == null) {
#    liquid = "coffee";
#  }
#  return "Filling the " + container + " with " + liquid + "...";
#};

# 区间:
list = [1..5] #=> var list = [1, 2, 3, 4, 5];

# 对象:
math =
  root:   Math.sqrt
  square: square
  cube:   (x) -> x * square x
#=> var math = {
#  "root": Math.sqrt,
#  "square": square,
#  "cube": function(x) { return x * square(x); }
#}

# Splats:
race = (winner, runners...) ->
  print winner, runners
#=>race = function() {
#  var runners, winner;
#  winner = arguments[0], runners = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
#  return print(winner, runners);
#};

# 存在判断:
alert "I knew it!" if elvis?
#=> if(typeof elvis !== "undefined" && elvis !== null) { alert("I knew it!"); }

# 数组推导:
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

foods = ['broccoli', 'spinach', 'chocolate']
eat food for food in foods when food isnt 'chocolate'
#=>foods = ['broccoli', 'spinach', 'chocolate'];
#
#for (_k = 0, _len2 = foods.length; _k < _len2; _k++) {
#  food = foods[_k];
#  if (food !== 'chocolate') {
#    eat(food);
#  }
#}

