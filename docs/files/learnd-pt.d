
// Você sabe o que está por vir...
module hello;

import std.stdio;

// args é opcional
void main(string[] args) {
    writeln("Hello, World!");
}

import std.stdio;

void main() {

    // Condicionais e loops funcionam como esperado.
    for(int i = 0; i < 10000; i++) {
        writeln(i);
    }

    // 'auto' pode ser usado para inferir tipos.
    auto n = 1;

    // literais numéricos podem usar '_' como um separador de dígitos para maior clareza.
    while(n < 10_000) {
        n += n;
    }

    do {
        n -= (n / 2);
    } while(n > 0);

    // Por e enquanto são bons, mas em D-land preferimos loops 'foreach'.
    // O '..' cria um intervalo contínuo, incluindo o primeiro valor
    // mas excluindo o último.
    foreach(n; 1..1_000_000) {
        if(n % 2 == 0)
            writeln(n);
    }

    // Há também 'foreach_reverse' quando você deseja fazer um loop para trás.
    foreach_reverse(n; 1..int.max) {
        if(n % 2 == 1) {
            writeln(n);
        } else {
            writeln("No!");
        }
    }
}

// Aqui, 'T' é um parâmetro de tipo. Pense '<T>' em C++/C#/Java.
struct LinkedList(T) {
    T data = null;

    // Usar '!' para instanciar um tipo parametrizado. Mais uma vez, pense '<T>'.
    LinkedList!(T)* next;
}

class BinTree(T) {
    T data = null;

    // Se houver apenas um parâmetro de modelo, podemos omitir os parênteses.
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

// Use o alias para criar abreviações para tipos.
alias IntList = LinkedList!int;
alias NumTree = BinTree!double;

// Também podemos criar modelos de funções!
T max(T)(T a, T b) {
    if(a < b)
        return b;

    return a;
}

// Use a palavra-chave ref para garantir a passagem por referência. Ou seja, mesmo que 'a'
// e 'b' sejam tipos de valor, eles sempre serão passados por referência a 'swap ()'.
void swap(T)(ref T a, ref T b) {
    auto temp = a;

    a = b;
    b = temp;
}

// Com os modelos, também podemos parametrizar valores, não apenas tipos.
class Matrix(uint m, uint n, T = int) {
    T[m] rows;
    T[n] columns;
}

auto mat = new Matrix!(3, 3); // O tipo 'T' foi padronizado como 'int'.

// Considere uma classe parametrizada nos tipos 'T' e 'U'.
class MyClass(T, U) {
    T _data;
    U _other;
}

// E os métodos "getter" e "setter", assim:
class MyClass(T, U) {
    T _data;
    U _other;

    // Os construtores sempre são chamados de 'this'.
    this(T t, U u) {
        // This will call the setter methods below.
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
    @property void data(T t) {
        _data = t;
    }

    @property void other(U u) {
        _other = u;
    }
}

// E nós os usamos desta maneira:
void main() {
    auto mc = new MyClass!(int, string)(7, "seven");

    // Importe o módulo 'stdio' da biblioteca padrão para gravar no
    // console (as importações podem ser locais para um escopo).
    import std.stdio;

    // Ligue para os getters para buscar os valores.
    writefln("Earlier: data = %d, str = %s", mc.data, mc.other);

    // Ligue para os setters para atribuir novos valores.
    mc.data = 8;
    mc.other = "eight";

    // Ligue para os getters novamente para buscar os novos valores.
    writefln("Later: data = %d, str = %s", mc.data, mc.other);
}

import std.algorithm : map, filter, reduce;
import std.range : iota; // cria uma gama exclusiva de final

void main() {
    // Queremos imprimir a soma de uma lista de quadrados de ints pares
    // de 1 a 100. Fácil!

    // Basta passar expressões lambda como parâmetros de modelo!
    // Você pode passar qualquer função que desejar, mas as lambdas são convenientes aqui.
    auto num = iota(1, 101).filter!(x => x % 2 == 0)
                           .map!(y => y ^^ 2)
                           .reduce!((a, b) => a + b);

    writeln(num);
}

// Digamos que queremos preencher uma matriz grande com a raiz quadrada de todos
// os números inteiros consecutivos começando de 1 (até o tamanho da matriz), e queremos
// fazer isso simultaneamente, aproveitando o número de núcleos que temos
// disponível.

import std.stdio;
import std.parallelism : parallel;
import std.math : sqrt;

void main() {
    // Crie sua grande variedade
    auto arr = new double[1_000_000];

    // Use um índice, acesse todos os elementos da matriz por referência (porque vamos
    // mudar cada elemento) e apenas chame paralelo na matriz!
    foreach(i, ref elem; parallel(arr)) {
        elem = sqrt(i + 1.0);
    }
}

