
// Esto es un comentario. Los comentarios de una sola línea se hacen así...
/* ...y los de múltiples líneas así */

//////////////////////////
// 1. Conceptos básicos //
//////////////////////////

// Funciones
// `i32` es el tipo para enteros de 32 bits con signo
fn suma2(x: i32, y: i32) -> i32 {
    // Retorno implícito (sin punto y coma)
    x + y
}

// Función principal
fn main() {
    // N;umeros //

    // Bindings (variables) inmutables
    let x: i32 = 1;

    // Sufijos para enteros / floats
    let y: i32 = 13i32;
    let f: f64 = 1.3f64;

    // Inferencia de tipos
    // La mayor parte del tiempo, el compilador de Rust puede inferir el tipo de
    // una variable, por lo que no necesitas escribir una anotación de tipo
    // explícita. A lo largo de este tutorial, los tipos están anotados
    // explícitamente en varios sitios, pero solo con propósito demostrativo. La
    // inferencia de tipos puede manejar esto por ti la mayor parte del tiempo.
    let x_implicita = 1;
    let f_implicita = 1.3;

    // Aritmética
    let sum = x + y + 13;

    // Variable mutable
    let mut mutable = 1;
    mutable = 4;
    mutable += 2;

    // Strings (cadenas de caracteres) //

    // Strings literales
    let x: &str = "hola mundo!";

    // Impresión por consola
    println!("{} {}", f, x); // 1.3 hola mundo!

    // Un `String` – una cadena en memoria dinámica (heap)
    let s: String = "hola mundo".to_string();

    // Una porión de cadena (slice) – una vista inmutable a otra cadena
    // Esto es básicamente un puntero inmutable a un string string – en realidad
    // no contiene los caracteres de la cadena, solo un puntero a algo que los
    // tiene (en este caso, `s`)
    let s_slice: &str = &s;

    println!("{} {}", s, s_slice); // hola mundo hola mundo

    // Vectores/arrays //

    // A fixed-size array
    let cuatro_enteros: [i32; 4] = [1, 2, 3, 4];

    // Un array dinámico (vector)
    let mut vector: Vec<i32> = vec![1, 2, 3, 4];
    vector.push(5);

    // Una porción (slice) – una vista inmutable a un vector o array
    // Esto es parecido a un slice de un string, pero para vectores
    let slice: &[i32] = &vector;

    // Usa `{:?}` para imprimir algo en estilo debug
    println!("{:?} {:?}", vector, slice); // [1, 2, 3, 4, 5] [1, 2, 3, 4, 5]

    // Tuplas //

    // Una tupla es un conjunto de tamaño fijo de valores. Pueden ser de diferente tipo.
    let x: (i32, &str, f64) = (1, "hola", 3.4);

    // Desestructurando `let`
    let (a, b, c) = x;
    println!("{} {} {}", a, b, c); // 1 hola 3.4

    // Indexando
    println!("{}", x.1); // hola

    //////////////
    // 2. Tipos //
    //////////////

    // Estructuras
    struct Punto {
        x: i32,
        y: i32,
    }

    let origen: Punto = Punto { x: 0, y: 0 };

    // Una estructura con campos sin nombre, una ‘estructura de tupla’
    struct Punto2(i32, i32);

    let origen2 = Punto2(0, 0);

    // Enums básicos como en C
    enum Direccion {
        Izquierda,
        Derecha,
        Arriba,
        Abajo,
    }

    let arriba = Direccion::Arriba;

    // Enum con campos
    enum OpcionalI32 {
        UnI32(i32),
        Nada,
    }

    let dos: OpcionalI32 = OpcionalI32::UnI32(2);
    let nada = OpcionalI32::Nada;

    // Genéricos //

    struct Foo<T> { bar: T }

    // Esto está definido en la librería estándar como `Option`
    enum Opcional<T> {
        AlgunVal(T),
        SinVal,
    }

    // Métodos //

    impl<T> Foo<T> {
        // Los métodos reciben un parámetro explícito `self`
        fn get_bar(self) -> T {
            self.bar
        }
    }

    let un_foo = Foo { bar: 1 };
    println!("{}", un_foo.get_bar()); // 1

    // Traits (conocidos como interfaces o typeclasses en otros lenguajes) //

    trait Frobnicate<T> {
        fn frobnicate(self) -> Option<T>;
    }

    impl<T> Frobnicate<T> for Foo<T> {
        fn frobnicate(self) -> Option<T> {
            Some(self.bar)
        }
    }

    let otro_foo = Foo { bar: 1 };
    println!("{:?}", otro_foo.frobnicate()); // Some(1)

    /////////////////////////////////
    // 3. Comparación con patrones //
    /////////////////////////////////

    let foo = OpcionalI32::UnI32(1);
    match foo {
        OpcionalI32::UnI32(n) => println!("es un i32: {}", n),
        OpcionalI32::Nada  => println!("no es nada!"),
    }

    // comparación de patrones avanzada
    struct FooBar { x: i32, y: OpcionalI32 }
    let bar = FooBar { x: 15, y: OpcionalI32::UnI32(32) };

    match bar {
        FooBar { x: 0, y: OpcionalI32::UnI32(0) } =>
            println!("Los números son cero!"),
        FooBar { x: n, y: OpcionalI32::UnI32(m) } if n == m =>
            println!("Los números son iguales"),
        FooBar { x: n, y: OpcionalI32::UnI32(m) } =>
            println!("Números diferentes: {} {}", n, m),
        FooBar { x: _, y: OpcionalI32::Nada } =>
            println!("El segudo número no es nada!"),
    }

    /////////////////////////
    // 4. Flujo de control //
    /////////////////////////

    // bucles `for`
    let array = [1, 2, 3];
    for i in array {
        println!("{}", i);
    }

    // Rangos
    for i in 0u32..10 {
        print!("{} ", i);
    }
    println!("");
    // imprime `0 1 2 3 4 5 6 7 8 9 `

    // `if`
    if 1 == 1 {
        println!("Las matemáticas funcionan!");
    } else {
        println!("Oh no...");
    }

    // `if` como una expresión
    let valor = if true {
        "bueno"
    } else {
        "malo"
    };

    // bucle `while`
    while 1 == 1 {
        println!("El universo está funcionando correctamente.");
    }

    // Bucle infinito
    loop {
        println!("Hola!");
    }

    ////////////////////////////////////////
    // 5. Seguridad de memoria y punteros //
    ////////////////////////////////////////

    // Posesión de punteros – solo uno puede ‘poseer’ un puntero en cada momento
    // Esto significa que cuando la `Box` queda fuera del ámbito, puede ser
    // liberada automáticamente de manera segura.
    let mut mio: Box<i32> = Box::new(3);
    *mio = 5; // dereferenciar
    // Aquí, `ahora_es_mio`, toma posesión de `mio`. En otras palabras, `mio` se
    // mueve.
    let mut ahora_es_mio = mio;
    *ahora_es_mio += 2;

    println!("{}", ahora_es_mio); // 7
    // println!("{}", mio); // esto no compilaría, porque `now_its_mine` es el
    // que posee el puntero

    // Referencia – un puntero inmutable que referencia a otro dato
    // Cuando se crea una referencia a un valor, decimos que el valor ha sido
    // ‘tomado prestado’.
    // Mientras un valor está prestado como inmutable, no puede ser modificado o
    // movido.
    // Una prestación dura hasta el fin del ámbito en el que se creó.
    let mut var = 4;
    var = 3;
    let ref_var: &i32 = &var;

    println!("{}", var); // A diferencia de `mio`, `var` se puede seguir usando
    println!("{}", *ref_var);
    // var = 5; // esto no compilaría, porque `var` está prestada
    // *ref_var = 6; // esto tampoco, porque `ref_var` es una referencia
    // inmutable

    // Referencia mutable
    // Mientras que un valor está prestado como mutable, no puede ser accedido
    // desde ningún otro sitio.
    let mut var2 = 4;
    let ref_var2: &mut i32 = &mut var2;
    *ref_var2 += 2; // '*' se usa para apuntar al var2 prestado como mutable

    println!("{}", *ref_var2); // 6 , //var2 no compilaría. //ref_var2 es de
                               // tipo &mut i32, por lo que guarda una
                               // referencia a un i32 no el valor.
    // var2 = 2; // esto no compilaría porque `var2` está prestado
}

