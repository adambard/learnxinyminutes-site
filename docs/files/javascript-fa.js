
// Comments are like C. Single-line comments start with two slashes,
/* and multiline comments start with slash-star
   and end with star-slash */

doStuff();

doStuff()

3; // = 3
1.5; // = 1.5

1 + 1; // = 2
8 - 1; // = 7
10 * 2; // = 20
35 / 5; // = 7

5 / 2; // = 2.5

1 << 2; // = 4

(1 + 3) * 2; // = 8

Infinity; // result of e.g. 1/0
-Infinity; // result of e.g. -1/0
NaN; // result of e.g. 0/0

true;
false;

'abc';
"Hello, world";

!true; // = false
!false; // = true

1 == 1; // = true
2 == 1; // = false

1 != 1; // = false
2 != 1; // = true

1 < 10; // = true
1 > 10; // = false
2 <= 2; // = true
2 >= 2; // = true

"Hello " + "world!"; // = "Hello world!"

"a" < "b"; // = true

"5" == 5; // = true

"5" === 5; // = false

"This is a string".charAt(0);

null; // used to indicate a deliberate non-value
undefined; // used to indicate a value is not currently present (although undefined
           // is actually a value itself)

var someVar = 5;

someOtherVar = 10;

var someThirdVar; // = undefined

someVar += 5; // equivalent to someVar = someVar + 5; someVar is 10 now
someVar *= 10; // now someVar is 100

someVar++; // now someVar is 101
someVar--; // back to 100

var myArray = ["Hello", 45, true];

myArray[1]; // = 45

myArray.push("World");
myArray.length; // = 4

var myObj = {key1: "Hello", key2: "World"};

var myObj = {myKey: "myValue", "my other key": 4};

myObj["my other key"]; // = 4

myObj.myKey; // = "myValue"

myObj.myThirdKey = true;

myObj.myFourthKey; // = undefined

var count = 1;
if (count == 3){
    // evaluated if count is 3
} else if (count == 4) {
    // evaluated if count is 4
} else {
    // evaluated if it's not either 3 or 4
}

while (true) {
    // An infinite loop!
}

var input
do {
    input = getInput();
} while (!isValid(input))

for (var i = 0; i < 5; i++){
    // will run 5 times
}

if (house.size == "big" && house.colour == "blue"){
    house.contains = "bear";
}
if (colour == "red" || colour == "blue"){
    // colour is either red or blue
}

var name = otherName || "default";

function myFunction(thing){
    return thing.toUpperCase();
}
myFunction("foo"); // = "FOO"

function myFunction(){
    // this code will be called in 5 seconds' time
}
setTimeout(myFunction, 5000);

setTimeout(function(){
    // this code will be called in 5 seconds' time
}, 5000);

if (true){
    var i = 5;
}
i; // = 5 - not undefined as you'd expect in a block-scoped language

(function(){
    var temporary = 5;
    // We can access the global scope by assiging to the 'global object', which
    // in a web browser is always 'window'. The global object may have a
    // different name in non-browser environments such as Node.js.
    window.permanent = 10;
})();
temporary; // raises ReferenceError
permanent; // = 10

function sayHelloInFiveSeconds(name){
    var prompt = "Hello, " + name + "!";
    function inner(){
        alert(prompt);
    }
    setTimeout(inner, 5000);
    // setTimeout is asynchronous, so the sayHelloInFiveSeconds function will
    // exit immediately, and setTimeout will call inner afterwards. However,
    // because inner is "closed over" sayHelloInFiveSeconds, inner still has
    // access to the 'prompt' variable when it is finally called.
}
sayHelloInFiveSeconds("Adam"); // will open a popup with "Hello, Adam!" in 5s

var myObj = {
    myFunc: function(){
        return "Hello world!";
    }
};
myObj.myFunc(); // = "Hello world!"

myObj = {
    myString: "Hello world!",
    myFunc: function(){
        return this.myString;
    }
};
myObj.myFunc(); // = "Hello world!"

var myFunc = myObj.myFunc;
myFunc(); // = undefined

var myOtherFunc = function(){
    return this.myString.toUpperCase();
}
myObj.myOtherFunc = myOtherFunc;
myObj.myOtherFunc(); // = "HELLO WORLD!"

var MyConstructor = function(){
    this.myNumber = 5;
}
myNewObj = new MyConstructor(); // = {myNumber: 5}
myNewObj.myNumber; // = 5

var myObj = {
    myString: "Hello world!",
};
var myPrototype = {
    meaningOfLife: 42,
    myFunc: function(){
        return this.myString.toLowerCase()
    }
};
myObj.__proto__ = myPrototype;
myObj.meaningOfLife; // = 42

myObj.myFunc(); // = "hello world!"

myPrototype.__proto__ = {
    myBoolean: true
};
myObj.myBoolean; // = true

myPrototype.meaningOfLife = 43;
myObj.meaningOfLife; // = 43

var myObj = Object.create(myPrototype);
myObj.meaningOfLife; // = 43

MyConstructor.prototype = {
    myNumber: 5,
    getMyNumber: function(){
        return this.myNumber;
    }
};
var myNewObj2 = new MyConstructor();
myNewObj2.getMyNumber(); // = 5
myNewObj2.myNumber = 6
myNewObj2.getMyNumber(); // = 6

var myNumber = 12;
var myNumberObj = new Number(12);
myNumber == myNumberObj; // = true

typeof myNumber; // = 'number'
typeof myNumberObj; // = 'object'
myNumber === myNumberObj; // = false
if (0){
    // This code won't execute, because 0 is falsy.
}

String.prototype.firstCharacter = function(){
    return this.charAt(0);
}
"abc".firstCharacter(); // = "a"

if (Object.create === undefined){ // don't overwrite it if it exists
    Object.create = function(proto){
        // make a temporary constructor with the right prototype
        var Constructor = function(){};
        Constructor.prototype = proto;
        // then use it to create a new, appropriately-prototyped object
        return new Constructor();
    }
}

