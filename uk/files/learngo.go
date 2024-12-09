// Однорядковий коментар
/* Багато-
 рядковий коментар */

// Кожен файл вихідного коду має починатись із ключового слова package.
// main - це спеціальна назва, що оголошує виконуваний код, а не бібліотеку.
package main

// import оголошує бібліотеки, що використовуються в даному файлі.
import (
	"fmt"       // Пакет стандартної бібліотеки Go.
	"io/ioutil" // Цей пакет реалізує деякі I/O функції утиліт.
	m "math"    // Бібліотека математичних операцій з локальним псевдонімом m.
	"net/http"  // Так, веб сервер!
	"os"        // Функції операційної системи, такі як робота з файловою системою.
	"strconv"   // Перетворення текстових змінних.
)

// Оголошення функції. 
// Функція main - особлива. Це вхідна точка для виконуваних програм.
// Ви можете любити це, або ж ненавидіти, але Go використовує фігурні дужки.
func main() {
	// Println виводить рядок в stdout.
	// Ця функція входить у пакет fmt.
	fmt.Println("Hello world!")

	// Викликати іншу функцію з цього файлу.
	beyondHello()
}

// Аргументи функцій описуються у круглих дужках.
// Навіть якщо ніякі аргументи не передаються, пусті круглі дужки - обов`язкові.
func beyondHello() {
	var x int // Оголошення змінної. Перед використанням змінні обов'язково мають бути оголошені.
	x = 3     // Присвоєння значення.
	// "Короткі" оголошення використовують := щоб окреслити тип, оголосити та присвоїти значення.
	y := 4
	sum, prod := learnMultiple(x, y)        // Функція повертає два значення.
	fmt.Println("sum:", sum, "prod:", prod) // Просто вивід.
	learnTypes()                            // < y хвилин, потрібно вивчити більше!
}

/* <- багаторядковий коментар
Функції можуть мати параметри та повертати довільну кількість значень.
В цьому прикладі `x`, `y` - це аргументи, а `sum`, `prod` - це змінні, що повертаються.
Зверніть увагу, що `x` та `sum` мають тип `int`.
*/
func learnMultiple(x, y int) (sum, prod int) {
	return x + y, x * y // Повернути два значення.
}

// Кілька вбудованих типів та літералів.
func learnTypes() {
	// Короткі оголошення зазвичай виконують все, що необхідно.
	str := "Вчи Go!" // рядок (string).

	s2 := `"Необроблений" текст
може містити переноси рядків.` // Також має тип рядок.

	// Не ASCII символи. Go використовує UTF-8.
	g := 'Σ' // руничний тип, псевдонім для int32, містить позицію юнікод кода.

	f := 3.14195 // float64, IEEE-754 64-бітне число з плаваючою крапкою.
	c := 3 + 4i  // complex128, комплексні числа, що являють собою два float64.

	// Синтаксис ініціалізації з var.
	var u uint = 7 // Беззнаковий цілочисельний тип, проте розмір залежить від імплементації, так само як і int.
	var pi float32 = 22. / 7

	// Синтаксис перетворення типів з коротким оголошенням.
	n := byte('\n') // Байт - це переіменований uint8.

	// Розмір масива фіксований протягом часу виконання.
	var a4 [4]int           // Масив з 4 чисел, всі проініціалізовані 0.
	a5 := [...]int{3, 1, 5, 10, 100} // Масив проініціалізованих чисел з фіксованим розміром у 
	// п'ять елементів, що мають значення 3, 1, 5, 10, та 100.

	// Зрізи мають динамічний розмір. Переваги є і у масивів, й у зрізів, проте
	// останні використовуються частіше.
	s3 := []int{4, 5, 9}    // Порівняйте з a5. Тут немає трьокрапки.
	s4 := make([]int, 4)    // Виділяє пам'ять для зрізу з 4 чисел, проініціалізованих 0.
	var d2 [][]float64      // Декларація, нічого не виділяється.
	bs := []byte("a slice") // Синтаксис переведення у інший тип.

	// Оскільки зрізи динамічні, до них можна додавати елементи за необхідністю.
	// Для цієї операції використовується вбудована функція append().
	// Перший аргумент - це зріз, до якого додається елемент. Зазвичай 
	// змінна масиву оновлюється на місці, як у прикладі нижче.
	s := []int{1, 2, 3}		// В результаті отримуємо зріз із 3 чисел.
	s = append(s, 4, 5, 6)	// додаємо 3 елементи. Зріз тепер довжини 6.
	fmt.Println(s) // Оновлений зріз тепер має значення [1 2 3 4 5 6]

	// Щоб об'єднати два зрізи, замість того, щоб проходитись по всім елементам,
	// можна передати посилання на зріз із трьокрапкою, як у прикладі нижче. Таким чином,
	// зріз розпакується і його елементи додадуться до зріза s.
	s = append(s, []int{7, 8, 9}...)
	fmt.Println(s)	// Оновлений зріз тепер дорівнює [1 2 3 4 5 6 7 8 9]

	p, q := learnMemory() // Оголошує змінні p, q, що є вказівниками на числа.
	fmt.Println(*p, *q)   // * іде попереду вказівника. Таким чином, виводяться числа.

	// Асоціативний масив (map) - це динамічно розширюваний тип даних, як хеш
	// або словник в інших мовах програмування
	m := map[string]int{"three": 3, "four": 4}
	m["one"] = 1

	// В Go  змінні, які не використовуються, вважаються помилкою.
	// Нижнє підкреслення дозволяє "використати" змінну, але проігнорувати значення.
	_, _, _, _, _, _, _, _, _, _ = str, s2, g, f, u, pi, n, a5, s4, bs
	// Зазвичай це використовується, щоб проігнорувати значення, що повертає функція.
	// Наприклад, в скрипті нашвидкоруч можна проігнорувати помилку, яку повертає
	// функція os.Create, вважаючи, що файл буде створений за будь-яких умов.
	file, _ := os.Create("output.txt")
	fmt.Fprint(file, "Приклад, як відбувається запис у файл.")
	file.Close()
	
	// Вивід значень змінних.
	fmt.Println(s, c, a4, s3, d2, m)

	learnFlowControl() // Рухаємось далі.
}

// Навідміну від більшості інших мов програмування, функції в Go підтримують 
// іменоване значення, що повертається. 
// Змінні, значення яких повертається функцією, вказуються із зазначенням типу при
// оголошенні функції. Таким чином, можна з легкістю повернути їхні значення в різних
// точках коду, не перелічуючи їх після ключового слова return.
func learnNamedReturns(x, y int) (z int) {
	z = x * y
	return // z не потрібно вказувати, при оголошенні описано змінну для повернення.
}

// Go використовує сміттєзбірник. В ньому використовуються вказівники, проте немає 
// операцій з вказівниками. Можлива помилка при використовуванні вказівника nil, але не 
// при збільшенні значення вказівника (перехід по адресам пам'яті). 
func learnMemory() (p, q *int) {
	// Іменовані змінні, що повертаються, p та q, мають тип вказівника на чисельне значення.
	p = new(int) // Вбудована функція виділяє нову пам'ять.
	// Виділена адреса пам'яті чисельного типу int ініціалізовується 0, p більше не nil.
	s := make([]int, 20) // Виділити пам'ять для 20 чисел у вигляді суцільного блоку в пам'яті.
	s[3] = 7             // Присвоїти значення одному з них.
	r := -2              // Оголосити нову локальну змінну.
	return &s[3], &r     // Оператор & повертає адресу в пам'яті об'єкта.
}

func expensiveComputation() float64 {
	return m.Exp(10)
}

func learnFlowControl() {
	// if твердження вимагає фігурні дужки, але не вимагає округлих.
	if true {
		fmt.Println("Кажу ж")
	}
	// Форматування стандартизовано командою командного рядка "go fmt". 
	if false {
		// Pout.
	} else {
		// Gloat.
	}
	// Використання перемикача (switch) замість ланцюга if-тверджень.
	x := 42.0
	switch x {
	case 0:
	case 1:
	case 42:
		// Кейси не "провалюються". Натомість, є ключове слово `fallthrough`:
		// https://go.dev/wiki/Switch#fall-through (англ)
	case 43:
		// Недоступний.
	default:
		// Кейс за замовчуванням не обов'язковий.
	}
	// Як і if, формат оголошення циклу for не вимагає круглих дужок:
	// Змінні, оголошені всередині if та for - належать цій області видимості.
	for x := 0; x < 3; x++ { // ++ - це твердження.
		fmt.Println("iteration", x)
	}
	// Тут x == 42.

	// For - це єдиний цикл в Go, проте він має кілька різних форм.
	for { // Ініціалізація циклу.
		break    // Упс, помилково зайшли.
		continue // Недоступне твердження.
	}

	// Можна використовувати діапазони, зрізи, рядки, асоціативні масиви, або ж
	// канал для ітерації в циклі. Діапазон (range) повертає один (канал) або два
	// значення (масив, зріз, рядок та асоціативний масив).
	for key, value := range map[string]int{"one": 1, "two": 2, "three": 3} {
		// для кожної пари в асоціативному масиві, надрукувати ключ та значення
		fmt.Printf("key=%s, value=%d\n", key, value)
	}
	// якщо потрібне тільки значення, можна застосувати нижнє підкреслення як ключ
	for _, name := range []string{"Bob", "Bill", "Joe"} {
		fmt.Printf("Hello, %s\n", name)
	}

	// так само, як і з циклом for, оператор := в розгалуженні означає оголосити 
	// локальну змінну в області видимості if та присвоїти значення. Далі
	// значення змінної проходить перевірку y > x.
	if y := expensiveComputation(); y > x {
		x = y
	}
	// Літерали функцій - це замикання
	xBig := func() bool {
		return x > 10000 // Посилання на x, що був оголошений раніше, перед switch.
	}
	x = 99999
	fmt.Println("xBig:", xBig()) // true
	x = 1.3e3                    // Тобто, тепер x == 1300
	fmt.Println("xBig:", xBig()) // false тепер.

	// Функція може бути оголошена та викликана в одному рядку, поводячи себе 
	// як аргумент функції, але за наступних умов:
	// 1) літерал функції негайно викликається за допомогою ()
	// 2) тип значення, що повертається, точно відповідає очікуваному типу аргументу
	fmt.Println("Add + double two numbers: ",
		func(a, b int) int {
			return (a + b) * 2
		}(10, 2)) // Викликаємо з аргументами 10 та 2
	// => Додати + подвоїти два числа: 24

	// Коли вам це знадобиться, ви полюбите це
	goto love
love:

	learnFunctionFactory() // функція, що повертає функцію - це весело(3)(3)
	learnDefer()      // Швидкий обхід до важливого ключового слова.
	learnInterfaces() // Тут на вас чекає крута штука!
}

func learnFunctionFactory() {
	// Два наступних твердження роблять однакові дії, але другий приклад частіше 
	// застосовується
	fmt.Println(sentenceFactory("summer")("A beautiful", "day!"))

	d := sentenceFactory("summer")
	fmt.Println(d("A beautiful", "day!"))
	fmt.Println(d("A lazy", "afternoon!"))
}

// Декоратори звична річ для багатьох мов програмування. В Go їх можна реалізувати
// за допомогою літералів функцій, що приймають аргументи.
func sentenceFactory(mystring string) func(before, after string) string {
	return func(before, after string) string {
		return fmt.Sprintf("%s %s %s", before, mystring, after) // новий рядок
	}
}

func learnDefer() (ok bool) {
	// твердження defer змушує функцію посилатись на список. Список 
	// збережених викликів виконується ПІСЛЯ того, як оточуюча функція закінчує
	// виконання.
	defer fmt.Println("відкладені твердження виконуються у зворотньому порядку (LIFO).")
	defer fmt.Println("\nЦей рядок надрукується першим, тому що")
	// Відкладення зазвичай використовується для того, щоб закрити файл. Таким чином,
	// функція, що закриває файл, залишається близькою до функції, що відкриває файл.
	return true
}

// Оголошує Stringer як тип інтерфейсу з одним методом, String.
type Stringer interface {
	String() string
}

// Оголошує pair як структуру з двома полями, цілими числами x та y.
type pair struct {
	x, y int
}

// Оголошує метод для типу pair. pair тепер реалізує Stringer, оскільки pair оголосив
// всі методи в цьому інтерфейсі.
func (p pair) String() string { // p тепер називається "приймачем"
	// Sprintf - ще одна функція з пакету fmt.
	// Крапка використовується, щоб звернутись до полів об'єкту p.
	return fmt.Sprintf("(%d, %d)", p.x, p.y)
}

func learnInterfaces() {
	// Синтаксис з використанням фігурних дужок називається "літералом структури".
	// Він застосовується до ініціалізованої структури. Оператор := оголошує
	// та ініціалізує p цією структурою.
	p := pair{3, 4}
	fmt.Println(p.String()) // Викликає метод String об'єкта p типу pair.
	var i Stringer          // Оголошує і інтерфейсного типу Stringer.
	i = p                   // Допустиме, оскільки pair реалізує Stringer
	// Викликає метод String об'єкта і, що має тип Stringer. Виводить те ж саме, що й 
	// аналогічний метод вище.
	fmt.Println(i.String())

	// Функції з бібліотеки fmt викликають метод String, щоб запросити у об'єкта
	// своє представлення, яке можна надрукувати.
	fmt.Println(p) // Виводить те ж саме, що й раніше.
	fmt.Println(i) // Виводить те ж саме, що й раніше.

	learnVariadicParams("great", "learning", "here!")
}

// Кількість аргументів функції може бути змінною.
func learnVariadicParams(myStrings ...interface{}) {
	// Пройтись по значенням всіх аргументів.
	// _ - це ігнорування порядкового номеру аргумента в масиві.
	for _, param := range myStrings {
		fmt.Println("param:", param)
	}

	// Передати значення аргументів як параметр змінної величини.
	fmt.Println("params:", fmt.Sprintln(myStrings...))

	learnErrorHandling()
}

func learnErrorHandling() {
	// Ідіома ", ok"використовується, щоб перевірити виконання команди без помилок.
	m := map[int]string{3: "three", 4: "four"}
	if x, ok := m[1]; !ok { // ok буде мати значення false, тому що 1 не знаходиться 
							// в асоціативному масиві.
		fmt.Println("немає таких")
	} else {
		fmt.Print(x) // x буде мати значення 1, якщо 1 знаходиться в m.
	}
	// Значення помилки повідомляє не тільки, що все добре, але й може розповісти 
	// більше про проблему.
	if _, err := strconv.Atoi("non-int"); err != nil { // _ ігнорує значення
		// виводить помилку 'strconv.ParseInt: parsing "non-int": invalid syntax'
		fmt.Println(err)
	}
	// Ми розглянемо інтерфейси дещо пізніше. А поки, розглянемо багатопоточність.
	learnConcurrency()
}

// Канал с - це потокозохищений об'єкт для спілкування між потоками.
func inc(i int, c chan int) {
	c <- i + 1 // Оператор <- виконує операцію "надіслати",якщо змінна каналу 
			   // знаходиться зліва від нього.
}

// inc виконує збільшення значення на 1. Ми використаємо його, щоб збільшувати
// числа рівночасно.
func learnConcurrency() {
	// вже знайома функція make, яка раніше використовувалась для виділення пам'яті, 
	// тут використовується для створення каналу. Make виділяє пам'ять та ініціалізує
	// зрізи, асоційовані масиви та канали. Новостворений канал буде передавати 
	// цілочисельні значення.
	c := make(chan int)
	// Запустити три одночасні ґорутини. Числа будуть збільшуватись рівночасно, імовірно
	// паралельно якщо пристрій здатний до цього та правильно сконфігурований.
	// Всі три ґорутини надсилають значення в один канал.
	go inc(0, c) // Твердження go запускає нову ґорутину.
	go inc(10, c)
	go inc(-805, c)
	// Читаємо три результати з каналу та друкуємо їх.
	// Порядок результатів - невідомий!
	fmt.Println(<-c, <-c, <-c) // якщо канал знаходиться справа від оператора <-, 
								// він виконує функцію "приймача".

	cs := make(chan string)       // Ще один канал, який примає рядки.
	ccs := make(chan chan string) // Канал каналів рядків.
	go func() { c <- 84 }()       // Запустимо нову ґорутину, щоб надіслати значення в канал с.
	go func() { cs <- "wordy" }() // Надсилаємо "wordy" в канал cs.
	// Ключове слово select має синтаксис, подібний до switch, проте кожен кейс
	// включає в себе операцію з каналом. Він обирає довільний кейс з наявних, які готові
	// комунікувати (передавати дані).
	select {
	case i := <-c: // Отримане значення може бути присвоєно змінній,
		fmt.Printf("it's a %T", i)
	case <-cs: // або значення може бути проігнороване.
		fmt.Println("it's a string")
	case <-ccs: // Пустий канал, не готовий комунікувати.
		fmt.Println("Не відбудеться.")
	}
	// На цьому етапі, значення було прочитане або з с або з cs. Одна з двох
	// ґорутин завершилась, але інша все ще заблокована.

	learnWebProgramming() // Go вміє й у веб. Так, ти хочеш зробити це.
}

// Лиш одна функція з пакету http запускає веб сервер.
func learnWebProgramming() {
	
	// перший аргумент ListenAndServe - це TCP адреса, який сервер буде слухати.
	// Другий аргумент - це інтерфейс, а точніше http.Handler.
	go func() {
		err := http.ListenAndServe(":8080", pair{})
		fmt.Println(err) // не ігноруйте помилки
	}()

	requestServer()
}

// pair матиме тип http.Handler, якщо реалізувати один його метод, ServeHTTP.
func (p pair) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	// Відповідати на запити можна методом, що належить http.ResponseWriter.
	w.Write([]byte("Ти вивчив Go за Y хвилин!"))
}

func requestServer() {
	resp, err := http.Get("http://localhost:8080")
	fmt.Println(err)
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	fmt.Printf("\nWebserver said: `%s`", string(body))
}
