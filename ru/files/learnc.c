// Однострочный комментарий начинается с // - доступен только после С99.

/*
Многострочный комментарий выглядит так. Работает начиная с С89.
*/

// Импорт файлов происходит с помощью **#include**
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// Файлы <в угловых скобочках> будут подключаться из стандартной библиотеки.
// Свои файлы необходимо подключать с помощью "двойных кавычек".
#include "my_header.h"

// Объявление функций должно происходить в .h файлах или вверху .c файла.
void function_1();
void function_2();

// Точка входа в программу – это функция main.
int main() {
    // для форматированного вывода в консоль используется printf
    // %d – означает, что будем выводить целое число, \n переводит указатель вывода
    // на новую строчку
    printf("%d\n", 0); // => напечатает "0"
    // Каждый оператор заканчивается точкой с запятой.

    ///////////////////////////////////////
    // Типы
    ///////////////////////////////////////

    // int обычно имеет длину 4 байта
    int x_int = 0;

    // short обычно имеет длину 2 байта
    short x_short = 0;

    // char гарантированно имеет длину 1 байта
    char x_char = 0;
    char y_char = 'y'; // Символьные литералы заключаются в кавычки ''

    // long как правило занимает от 4 до 8 байт
    // long long занимает как минимум 64 бита
    long x_long = 0;
    long long x_long_long = 0;

    // float это 32-битное число с плавающей точкой
    float x_float = 0.0;

    // double это 64-битное число с плавающей точкой
    double x_double = 0.0;

    // Целые типы могут быть беззнаковыми.
    unsigned short ux_short;
    unsigned int ux_int;
    unsigned long long ux_long_long;

    // sizeof(T) возвращает размер переменной типа Т в байтах.
    // sizeof(obj) возвращает размер объекта obj в байтах.
    printf("%zu\n", sizeof(int)); // => 4 (на большинстве машин int занимает 4 байта)

    // Если аргументом sizeof будет выражение, то этот аргумент вычисляется
    // ещё во время компиляции кода (кроме динамических массивов).
    int a = 1;
    // size_t это беззнаковый целый тип который использует как минимум 2 байта
    // для записи размера объекта
    size_t size = sizeof(a++); // a++ не выполнится
    printf("sizeof(a++) = %zu, где a = %d\n", size, a);
    // выведет строку "sizeof(a++) = 4, где a = 1" (на 32-битной архитектуре)

    // Можно задать размер массива при объявлении.
    char my_char_array[20]; // Этот массив занимает 1 * 20 = 20 байт
    int my_int_array[20]; // Этот массив занимает 4 * 20 = 80 байт (сумма 4-битных слов)

    // Можно обнулить массив при объявлении.
    char my_array[20] = {0};

    // Индексация массива происходит также как и в других Си-подобных языках.
    my_array[0]; // => 0

    // Массивы изменяемы. Это просто память как и другие переменные.
    my_array[1] = 2;
    printf("%d\n", my_array[1]); // => 2

    // В C99 (а также опционально в C11), массив может быть объявлен динамически.
    // Размер массива не обязательно должен быть рассчитан на этапе компиляции.
    printf("Enter the array size: "); // спрашиваем юзера размер массива
    char buf[0x100];
    fgets(buf, sizeof buf, stdin);
    size_t size = strtoul(buf, NULL, 10); // strtoul парсит строку в беззнаковое целое
    int var_length_array[size]; // объявление динамического массива
    printf("sizeof array = %zu\n", sizeof var_length_array);
    // Вывод программы (в зависимости от архитектуры) будет таким:
    // > Enter the array size: 10
    // > sizeof array = 40

    // Строка – это просто массив символов, оканчивающийся нулевым (NUL (0x00)) байтом
    // представляемым в строке специальным символом '\0'.
    // Нам не нужно вставлять нулевой байт в строковой литерал,
    // компилятор всё сделает за нас.
    char a_string[20] = "This is a string";
    printf("%s\n", a_string); // %s обозначает вывод строки

    printf("%d\n", a_string[16]); // => 0
    // байт #17 тоже равен 0 (а также 18, 19, и 20)

    // Если между одинарными кавычками есть символ – это символьный литерал,
    // но это тип int, а не char (по историческим причинам).

    int cha = 'a'; // хорошо
    char chb = 'a'; // тоже хорошо (подразумевается преобразование int в char)

    ///////////////////////////////////////
    // Операторы
    ///////////////////////////////////////

    // Можно использовать множественное объявление.
    int i1 = 1, i2 = 2;
    float f1 = 1.0, f2 = 2.0;

    // Арифметика обычная
    i1 + i2; // => 3
    i2 - i1; // => 1
    i2 * i1; // => 2
    i1 / i2; // => 0 (0.5, но обрезается до 0)

    f1 / f2; // => 0.5, плюс-минус погрешность потому что,
    // цифры с плавающей точкой вычисляются неточно!

    // Остаток от деления
    11 % 3; // => 2

    // Операции сравнения вам уже знакомы, но в Си нет булевого типа.
    // Вместо него используется int. 0 это false, всё остальное это true.
    // Операции сравнения всегда возвращают 1 или 0.
    3 == 2; // => 0 (false)
    3 != 2; // => 1 (true)
    3 > 2; // => 1
    3 < 2; // => 0
    2 <= 2; // => 1
    2 >= 2; // => 1

    // Си это не Питон – операции сравнения могут быть только парными.
    int a = 1;
    // ОШИБКА:
    int between_0_and_2 = 0 < a < 2;
    // Правильно:
    int between_0_and_2 = 0 < a && a < 2;

    // Логика
    !3; // => 0 (логическое НЕ)
    !0; // => 1
    1 && 1; // => 1 (логическое И)
    0 && 1; // => 0
    0 || 1; // => 1 (логическое ИЛИ)
    0 || 0; // => 0

    // Битовые операторы
    ~0x0F; // => 0xF0 (побитовое отрицание)
    0x0F & 0xF0; // => 0x00 (побитовое И)
    0x0F | 0xF0; // => 0xFF (побитовое ИЛИ)
    0x04 ^ 0x0F; // => 0x0B (исключающее ИЛИ (XOR))
    0x01 << 1; // => 0x02 (побитовый сдвиг влево (на 1))
    0x02 >> 1; // => 0x01 (побитовый сдвиг вправо (на 1))

    // Будьте осторожны при сдвиге беззнакового int, эти операции не определены:
    // - сдвиг в знаковый бит у целого числа (int a = 1 << 32)
    // - сдвиг влево отрицательных чисел (int a = -1 << 2)

    ///////////////////////////////////////
    // Структуры ветвления
    ///////////////////////////////////////

    // Условный оператор
    if (0) {
      printf("I am never run\n");
    } else if (0) {
      printf("I am also never run\n");
    } else {
      printf("I print\n");
    }

    // Цикл с предусловием
    int ii = 0;
    while (ii < 10) {
        printf("%d, ", ii++); // инкрементация происходит после того как
                              // значение ii передано ("postincrement")
    } // => prints "0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "

    printf("\n");

    // Цикл с постусловием
    int kk = 0;
    do {
        printf("%d, ", kk);
    } while (++kk < 10); // инкрементация происходит перед тем как
                         // передаётся значение kk ("preincrement")
    // => prints "0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "

    printf("\n");

    // Цикл со счётчиком
    int jj;
    for (jj=0; jj < 10; jj++) {
        printf("%d, ", jj);
    } // => prints "0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "

    printf("\n");

    // Ветвление с множественным выбором
    switch (some_integral_expression) {
    case 0: // значения должны быть целыми константами (и могут быть выражениями)
        do_stuff();
        break; // если не написать break; то управление будет передано следующему блоку
    case 1:
        do_something_else();
        break;
    default:
        // если не было совпадения, то выполняется блок default:
        fputs("ошибка!\n", stderr);
        exit(-1);
        break;
    }

    ///////////////////////////////////////
    // Форматирование вывода
    ///////////////////////////////////////

    // Каждое выражение в Си имеет тип, но вы можете привести один тип к другому,
    // если хотите (с некоторыми искажениями).

    int x_hex = 0x01; // Вы можете назначать переменные с помощью шестнадцатеричного кода.

    // Приведение типов будет пытаться сохранять цифровые значения.
    printf("%d\n", x_hex); // => Prints 1
    printf("%d\n", (short) x_hex); // => Prints 1
    printf("%d\n", (char) x_hex); // => Prints 1

    // Типы могут переполняться без вызова предупреждения.
    printf("%d\n", (unsigned char) 257); // => 1 (Max char = 255 if char is 8 bits long)

    // Для определения максимального значения типов `char`, `signed char` и `unisigned char`,
    // соответственно используйте CHAR_MAX, SCHAR_MAX и UCHAR_MAX макросы из <limits.h>

    // Целые типы могут быть приведены к вещественным и наоборот.
    printf("%f\n", (float)100); // %f formats a float
    printf("%lf\n", (double)100); // %lf formats a double
    printf("%d\n", (char)100.0);

    ///////////////////////////////////////
    // Указатели
    ///////////////////////////////////////

    // Указатель – это переменная которая хранит адрес в памяти.
    // При объявлении указателя указывается тип данных переменной на которую он будет ссылаться.
    // Вы можете получить адрес любой переменной, а потом работать с ним.

    // Используйте & для получения адреса переменной.
    int x = 0;
    printf("%p\n", (void *)&x); // => Напечатает адрес в памяти, где лежит переменная x
    // (%p выводит указатель на void *)

    // Для объявления указателя нужно поставить * перед именем.
    int *px, not_a_pointer; // px это указатель на int
    px = &x; // сохранит адрес x в px
    printf("%p\n", (void *)px); // => Напечатает адрес в памяти, где лежит переменная px
    printf("%zu, %zu\n", sizeof(px), sizeof(not_a_pointer));
    // => Напечатает "8, 4" в 64 битной системе

    // Для того, чтобы получить значение по адресу, напечатайте * перед именем.
    // Да, * используется при объявлении указателя и для получении значения по адресу
    // немного запутано, но вы привыкнете.
    printf("%d\n", *px); // => Напечатает 0, значение перемененной x

    // Вы также можете изменять значение, на которое указывает указатель.
    (*px)++; // Инкрементирует значение на которое указывает px на единицу
    printf("%d\n", *px); // => Напечатает 1
    printf("%d\n", x); // => Напечатает 1

    // Массивы удобно использовать для большого количества однотипных данных.
    int x_array[20];
    int xx;
    for (xx = 0; xx < 20; xx++) {
        x_array[xx] = 20 - xx;
    } // Объявление x_array с значениями 20, 19, 18,... 2, 1

    // Объявление указателя на int с адресом массива.
    int* x_ptr = x_array;
    // x_ptr сейчас указывает на первый элемент массива (со значением 20).
    // Это работает, потому что при обращении к имени массива возвращается
    // указатель на первый элемент.
    // Например, когда массив передаётся в функцию или присваивается указателю, он
    // неявно преобразуется в указатель.
    // Исключения: когда массив является аргументом для оператор '&':
    int arr[10];
    int (*ptr_to_arr)[10] = &arr; // &arr не является 'int *'!
                                  // он является "указателем на массив" (из десяти 'int'ов).
    // или когда массив это строчный литерал, используемый при объявлении массива символов:
    char arr[] = "foobarbazquirk";
    // или когда массив является аргументом `sizeof` или `alignof` операторов:
    int arr[10];
    int *ptr = arr; // то же самое что и "int *ptr = &arr[0];"
    printf("%zu %zu\n", sizeof arr, sizeof ptr); // напечатает "40, 4" или "40, 8"

    // Декрементация и инкрементация указателей зависит от их типа
    // (это называется арифметика указателей)
    printf("%d\n", *(x_ptr + 1)); // => Напечатает 19
    printf("%d\n", x_array[1]); // => Напечатает 19

    // Вы также можете динамически выделять несколько блоков памяти с помощью
    // функции malloc из стандартной библиотеки, которая принимает один
    // аргумент типа size_t – количество байт необходимых для выделения.
    int *my_ptr = malloc(sizeof(*my_ptr) * 20);
    for (xx = 0; xx < 20; xx++) {
        *(my_ptr + xx) = 20 - xx; // my_ptr[xx] = 20-xx
    } // Выделяет память для 20, 19, 18, 17... 2, 1 (как int'ы)

    // Работа с памятью с помощью указателей может давать неожиданные и
    // непредсказуемые результаты.
    printf("%d\n", *(my_ptr + 21)); // => Напечатает кто-нибудь знает, что?
                                    // Скорей всего программа вылетит.

    // Когда вы закончили работать с памятью, которую ранее выделили, вам необходимо
    // освободить её, иначе это может вызвать утечку памяти или ошибки.
    free(my_ptr);

    // Строки это массивы символов, но обычно они представляются как
    // указатели на символ (как указатели на первый элемент массива).
    // Хорошей практикой считается использование `const char *' при объявлении
    // строчного литерала. При таком подходе литерал не может быть изменён.
    // (например "foo"[0] = 'a' вызовет ошибку!)

    const char *my_str = "This is my very own string literal";
    printf("%c\n", *my_str); // => 'T'

    // Это не работает, если строка является массивом
    // (потенциально задаваемой с помощью строкового литерала)
    // который находится в перезаписываемой части памяти:

    char foo[] = "foo";
    foo[0] = 'a'; // это выполнится и строка теперь "aoo"

    void function_1()
} // конец функции main()

///////////////////////////////////////
// Функции
///////////////////////////////////////

// Синтаксис объявления функции:
// <возвращаемый тип> <имя функции>(аргументы)

int add_two_ints(int x1, int x2) {
    return x1 + x2; // Используйте return для возврата значения
}

/*
Данные в функцию передаются "по значению", но никто не мешает
вам передавать в функцию указатели и менять данные по указателям.

Например: инвертировать строку прямо в функции
*/

// void означает, что функция ничего не возвращает
void str_reverse(char *str_in) {
    char tmp;
    int ii = 0;
    size_t len = strlen(str_in); // `strlen()` является частью стандартной библиотеки
    for (ii = 0; ii < len / 2; ii++) {
        tmp = str_in[ii];
        str_in[ii] = str_in[len - ii - 1]; // ii-тый символ с конца
        str_in[len - ii - 1] = tmp;
    }
}

char c[] = "This is a test.";
str_reverse(c);
printf("%s\n", c); // => Выведет ".tset a si sihT"

///////////////////////////////////////
// Типы и структуры определяемые пользователем
///////////////////////////////////////

// typedef используется для задания стандартным типам своих названий
typedef int my_type;
my_type my_type_var = 0;

// Структуры это просто коллекция данных, память выделяется последовательно,
// в том порядке в котором записаны данные.
struct rectangle {
    int width;
    int height;
};

// sizeof(struct rectangle) == sizeof(int) + sizeof(int) – не всегда верно
// из-за особенностей компиляции (необычное поведение при отступах)[1].

void function_1() {
    struct rectangle my_rec;

    // Доступ к структурам через точку
    my_rec.width = 10;
    my_rec.height = 20;

    // Вы можете объявить указатель на структуру
    struct rectangle *my_rec_ptr = &my_rec;

    // Можно получить доступ к структуре и через указатель
    (*my_rec_ptr).width = 30;

    // ... или ещё лучше: используйте оператор -> для лучшей читабельности
    my_rec_ptr->height = 10; // то же что и "(*my_rec_ptr).height = 10;"
}

// Вы можете применить typedef к структуре, для удобства.
typedef struct rectangle rect;

int area(rect r) {
    return r.width * r.height;
}

// Если вы имеете большую структуру, можно получить доступ к ней "по указателю",
// чтобы избежать копирования всей структуры.
int area(const rect *r) {
    return r->width * r->height;
}

///////////////////////////////////////
// Указатели на функции
///////////////////////////////////////

/*
Во время исполнения функции находятся по известным адресам в памяти.
Указатель на функцию может быть использован для непосредственного вызова функции.
Однако синтаксис может сбивать с толку.

Пример: использование str_reverse по указателю
*/

void str_reverse_through_pointer(char *str_in) {
    // Определение функции через указатель.
    void (*f)(char *); // Сигнатура должна полностью совпадать с целевой функцией.
    f = &str_reverse; // Присвоить фактический адрес (во время исполнения)
    // "f = str_reverse;" тоже будет работать.
    // Имя функции (как и массива) возвращает указатель на начало.
    (*f)(str_in); // Просто вызываем функцию через указатель.
    // "f(str_in);" или вот так
}
