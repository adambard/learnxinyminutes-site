
// I commenti che stanno su una sola riga sono fatti così...
/* ...mentre così sono fatti
i commenti che richiedono
più righe */

///////////////////
// 1. Fondamenti //
///////////////////

// Funzioni
// `i32` è il tipo per gli interi a 32-bit con segno
fn add2(x: i32, y: i32) -> i32 {
    // return implicito (senza punto-e-virgola)
    x + y
}

// Funzione "main"
fn main() {
    // Numeri //

    // Binding (ossia "variabili") immutabili
    let x: i32 = 1;

    // Suffissi intero/virgola mobile
    let y: i32 = 13i32;
    let f: f64 = 1.3f64;

    // Inferenza di tipo
    // La maggior parte delle volte, il compilatore Rust può inferire
    // di quale tipo sia l'espressione usata per inizializzare un binding,
    // e quindi non è necessario specificare esplicitamente il tipo.
    // In tutto questo tutorial, i tipi vengono specificati esplicitamente in molti posti,
    // ma solo a scopo dimostrativo. La maggior parte delle volte se ne potrebbe
    // fare a meno, grazie all'inferenza di tipo.
    let implicito_x = 1;
    let implicito_f = 1.3;

    // Aritmetica
    let somma = x + y + 13;

    // Variabile mutevole
    let mut mutevole = 1;
    mutevole = 4;
    mutevole += 2;

    // Stringhe //

    // Letterali di stringa
    let x: &str = "Ciao mondo!";

    // Stampa
    println!("{} {}", f, x); // 1.3 Ciao mondo!

    // Una `String` – una stringa allocata nello heap
    let s: String = "Ciao mondo".to_string();

    // Uno slice (fetta) di stringa – una vista immutabile
    // all'interno di un'altra stringa.
    // Uno slice è una coppia immutabile di puntatori al buffer contenuto
    // nella stringa - non contiene dei caratteri, solo dei puntatori a
    // un buffer statico o a un buffer contenuto in un altro oggetto (in questo caso, `s`)
    let s_slice: &str = &s;

    println!("{} - {}", s, s_slice); // Ciao mondo - Ciao mondo

    // Vettori/array //

    // Un array di lunghezza fissa
    let quattro_int: [i32; 4] = [1, 2, 3, 4];

    // Un array dinamico (vettore)
    let mut vettore: Vec<i32> = vec![1, 2, 3, 4];
    vettore.push(5);

    // Uno slice – una vista immutabile all'interno di un vettore o di un array
    // E' molto simile a uno slice di stringa, ma per i vettori
    let slice: &[i32] = &vettore;

    // Usa `{:?}` per stampare qualcosa a scopo di debugging
    println!("{:?} {:?}", vettore, slice); // [1, 2, 3, 4, 5] [1, 2, 3, 4, 5]

    // Tuple //

    // Una tupla è un insieme ordinato di dimensione fissa di valori aventi tipi eventualmente diversi
    let x: (i32, &str, f64) = (1, "ciao", 3.4);

    // Il `let` che destruttura
    let (a, b, c) = x;
    println!("{} {} {}", a, b, c); // 1 ciao 3.4

    // Indicizzazione
    println!("{}", x.1); // ciao

    /////////////
    // 2. Tipi //
    /////////////

    // Strutture
    struct Punto {
        x: i32,
        y: i32,
    }

    let origine: Punto = Punto { x: 0, y: 0 };

    // Una struct con campi senza nome, chiamata ‘tuple struct’
    struct Punto2(i32, i32);

    let origine2 = Punto2(0, 0);

    // Enum basilare, analoga a quelle del linguaggio C
    enum Direzione {
        Sinistra,
        Destra,
        Su,
        Giu,
    }

    let su = Direzione::Su;

    // Enum con campi
    enum OpzionaleI32 {
        UnI32(i32),
        Niente,
    }

    let due: OpzionaleI32 = OpzionaleI32::UnI32(2);
    let niente = OpzionaleI32::Niente;

    // Generici //

    struct Foo<T> { bar: T }

    // Questo è definito nella libreria standard come `Option`
    enum Opzionale<T> {
        QualcheValore(T),
        NessunValore,
    }

    // Metodi //

    impl<T> Foo<T> {
        // I metodi di oggetto prendono un parametro `self` esplicito
        fn get_bar(self) -> T {
            self.bar
        }
    }

    let a_foo = Foo { bar: 1 };
    println!("{}", a_foo.get_bar()); // 1

    // I trait (tratti), noti come "interfacce" o "mixin" in altri linguaggi

    trait Maneggiamento<T> {
        fn maneggia(self) -> Option<T>;
    }

    impl<T> Maneggiamento<T> for Foo<T> {
        fn maneggia(self) -> Option<T> {
            Some(self.bar)
        }
    }

    let altro_foo = Foo { bar: 1 };
    println!("{:?}", altro_foo.maneggia()); // Some(1)

    /////////////////////////
    // 3. Pattern matching //
    /////////////////////////

    let foo = OpzionaleI32::UnI32(1);
    match foo {
        OpzionaleI32::UnI32(n) => println!("E' un i32: {}", n),
        OpzionaleI32::Niente  => println!("Non vale niente!"),
    }

    // Pattern matching avanzato
    struct FooBar { x: i32, y: OpzionaleI32 }
    let bar = FooBar { x: 15, y: OpzionaleI32::UnI32(32) };

    match bar {
        FooBar { x: 0, y: OpzionaleI32::UnI32(0) } =>
            println!("I numeri valgono zero!"),
        FooBar { x: n, y: OpzionaleI32::UnI32(m) } if n == m =>
            println!("I numeri sono identici"),
        FooBar { x: n, y: OpzionaleI32::UnI32(m) } =>
            println!("Numeri diversi: {} {}", n, m),
        FooBar { x: _, y: OpzionaleI32::Niente } =>
            println!("Il secondo numbero non vale niente!"),
    }

    ///////////////////////////////////////////
    // 4. Flusso di controllo (Control flow) //
    ///////////////////////////////////////////

    // Ciclo/iterazione con `for`
    let array = [1, 2, 3];
    for i in array {
        println!("{}", i);
    }

    // Range
    for i in 0u32..10 {
        print!("{} ", i);
    }
    println!("");
    // Stampa `0 1 2 3 4 5 6 7 8 9 `

    // `if`
    if 1 == 1 {
        println!("La matematica funziona!");
    } else {
        println!("Oh no...");
    }

    // `if` come espressione
    let value = if true {
        "bene"
    } else {
        "male"
    };

    // Ciclo `while`
    while 1 == 1 {
        println!("L'universo sta funzionando regolarmente.");
    }

    // Ciclo infinito
    loop {
        println!("Ciao!");
    }

    /////////////////////////////////////////////////
    // 5. La sicurezza della memoria e i puntatori //
    /////////////////////////////////////////////////

    // Puntatore posseduto (owned) – solamente una cosa sola per volta può ‘possedere’ questo puntatore
    // Ciò significa che quando il `Box` abbandona il suo scope, verrà automaticamente deallocato in sicurezza.
    let mut mio: Box<i32> = Box::new(3);
    *mio = 5; // dereference
    // Qui, `adesso_e_mio` acquisisce la proprietà di `mio`. In altre parole, `mio` viene spostato.
    let mut adesso_e_mio = mio;
    *adesso_e_mio += 2;

    println!("{}", adesso_e_mio); // 7
    // println!("{}", mio); // questo non compilerebbe perché `adesso_e_mio` adesso possiede il puntatore

    // Riferimento (reference) – un puntatore immutabile che si riferisce ad altri dati
    // Quando un riferimento viene preso a un valore, diciamo che quel valore
    // è stato ‘preso in prestito’ (borrowed).
    // Mentre un valore è preso in prestito immutabilmente, non può venire mutato né spostato.
    // Un prestito dura fino alla fine dello scope in cui è stato creato.
    let mut var = 4;
    var = 3;
    let ref_var: &i32 = &var;

    println!("{}", var); // Diversamente da `mio`, `var` può ancora essere usato
    println!("{}", *ref_var);
    // var = 5; // questo non compilerebbe, perché `var` è stato preso in prestito
    // *ref_var = 6; // neanche questo, perché `ref_var` è un riferimento immutabile

    // Riferimento immutabile
    // Mentre un valore è preso in presto mutevolmente, non può essere acceduto in nessun modo.
    let mut var2 = 4;
    let ref_var2: &mut i32 = &mut var2;
    *ref_var2 += 2;         // '*' serve a puntare al binding var2, preso in presto mutevolmente

    println!("{}", *ref_var2); // 6
    // var2 non compilerebbe. ref_var2 è di tipo &mut i32, e quindi 
    // immagazzina un riferimento a un i32, e non il valore stesso.
    // var2 = 2; // questo non compilerebbe, perché `var2` è stato preso in prestito
}

