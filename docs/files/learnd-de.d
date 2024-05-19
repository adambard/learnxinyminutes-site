
// Es war klar, dass das kommt...
module hello;

import std.stdio;

// argumente sind optional
void main(string[] args) {
    writeln("Hello, World!");
}

import std.stdio;

void main() {

    // Logische Ausdrücke und Schleifen funktionieren wie erwartet
    for(int i = 0; i < 10000; i++) {
        writeln(i);
    }

    auto n = 1; // auto um den Typ vom Compiler bestimmen zu lassen

    // Zahlenliterale können _ verwenden für Lesbarkeit
    while(n < 10_000) {
        n += n;
    }

    do {
        n -= (n / 2);
    } while(n > 0);

    // For und while sind ja schön und gut aber D bevorzugt foreach
    // Die '..' erstellen eine Spanne von Zahlen, inklusive dem ersten Wert
    // jedoch ohne dem letzten
    foreach(i; 1..1_000_000) {
        if(n % 2 == 0)
            writeln(i);
    }

    // Es gibt auch ein 'foreach_reverse' wenn du rückwerts gehen willst.
    foreach_reverse(i; 1..int.max) {
        if(n % 2 == 1) {
            writeln(i);
        } else {
            writeln("No!");
        }
    }
}

// Hier, T ist ein Type-Parameter, Er funktioniert wie Generics in C#/Java/C++
struct LinkedList(T) {
    T data = null;
    LinkedList!(T)* next; // Das ! wird verwendet, um T zu übergeben. (<T> in C#/Java/C++)
}

class BinTree(T) {
    T data = null;

    // Wenn es nur einen T Parameter gibt, können die Klammern um ihn weggelassen werden
    BinTree!T left;
    BinTree!T right;
}

enum Day {
    Sunday,
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
}

// Aliase können verwendet werden, um die Entwicklung zu erleichtern

alias IntList = LinkedList!int;
alias NumTree = BinTree!double;

// Funktionen können genau so Templates beinhalten

T max(T)(T a, T b) {
    if(a < b)
        return b;

    return a;
}

// Steht ref vor einem Parameter, wird sichergestellt, dass er als Referenz
übergeben wird. Selbst bei Werten wird es immer eine Referenz sein.
void swap(T)(ref T a, ref T b) {
    auto temp = a;

    a = b;
    b = temp;
}

// Templates können ebenso Werte parametrisieren.
class Matrix(uint m, uint n, T = int) {
    T[m] rows;
    T[n] columns;
}

auto mat = new Matrix!(3, 3); // Standardmäßig ist T vom Typ Integer

// Diese Klasse ist parameterisiert mit T, U

class MyClass(T, U) {
    T _data;
    U _other;

}

// Ihre Getter und Setter Methoden sehen so aus
class MyClass(T, U) {
    T _data;
    U _other;

    // Konstruktoren heißen immer `this`
    this(T t, U u) {
        data = t;
        other = u;
    }

    // getters
    @property T data() {
        return _data;
    }

    @property U other() {
        return _other;
    }

    // setters
    // @property kann genauso gut am ende der Methodensignatur stehen
    void data(T t) @property {
        _data = t;
    }

    void other(U u) @property {
        _other = u;
    }
}
// Und so kann man sie dann verwenden

void main() {
    auto mc = MyClass!(int, string);

    mc.data = 7;
    mc.other = "seven";

    writeln(mc.data);
    writeln(mc.other);
}

import std.algorithm : map, filter, reduce;
import std.range : iota; // builds an end-exclusive range

void main() {
    // Wir wollen die Summe aller Quadratzahlen zwischen
    // 1 und 100 ausgeben. Nichts leichter als das!

    // Einfach eine Lambda-Funktion als Template Parameter übergeben
    // Es ist genau so gut möglich eine normale Funktion hier zu übergeben
    // Lambdas bieten sich hier aber an.
    auto num = iota(1, 101).filter!(x => x % 2 == 0)
                           .map!(y => y ^^ 2)
                           .reduce!((a, b) => a + b);

    writeln(num);
}

import std.stdio;
import std.parallelism : parallel;
import std.math : sqrt;

void main() {
    // Wir wollen die Wurzel von jeder Zahl in unserem Array berechnen
    // und dabei alle Kerne verwenden, die wir zur verfügung haben
    auto arr = new double[1_000_000];

    // Wir verwenden den Index und das Element als Referenz
    // und rufen einfach parallel auf!
    foreach(i, ref elem; parallel(arr)) {
        ref = sqrt(i + 1.0);
    }
}

