//क्या आ रहा है पता है ...
module hello;

import std.stdio;

void main(string[] args) {
    writeln("Hello, World!");
}
import std.stdio;

void main() {

    for(int i = 0; i < 10000; i++) {
        writeln(i);
    }

    // 'auto' can be used for inferring types.
    auto n = 1;

    // संख्यात्मक literals स्पष्टता के लिए एक अंकों विभाजक के रूप में '_' का उपयोग कर सकते हैं।
    while(n < 10_000) {
        n += n;
    }

    do {
        n -= (n / 2);
    } while(n > 0);
    // लिए और जब तक अच्छा कर रहे हैं, लेकिन D में हम 'foreach' छोरों पसंद करते हैं।
    // '..' पहला मान सहित एक सतत श्रृंखला बनाता है,
    // लेकिन पिछले छोड़कर।
    foreach(i; 1..1_000_000) {
        if(n % 2 == 0)
            writeln(i);
    }

    // वहाँ भी 'foreach_reverse' आप पीछे की ओर पाश करना चाहते हैं।
    foreach_reverse(i; 1..int.max) {
        if(n % 2 == 1) {
            writeln(i);
        } else {
            writeln("No!");
        }
    }
}
// इधर, 'T' एक प्रकार पैरामीटर है। लगता है कि '&lt;+T&gt;' C++ / C/ Java से।
struct LinkedList(T) {
    T data = null;

    // '!'का प्रयोग करें , एक पैरामिट्रीकृत प्रकार इन्स्तांत । फिर, '<T >' लगता है।
    LinkedList!(T)* next;
}

class BinTree(T) {
    T data = null;

// केवल एक टेम्पलेट पैरामीटर नहीं है, तो  , हम कोष्ठकों छोड़ सकते हैं।
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

// उपयोग उर्फ प्रकार (alias) के लिए संक्षिप्त बनाने के लिए।
alias IntList = LinkedList!int;
alias NumTree = BinTree!double;

//हम के रूप में अच्छी तरह से कार्य टेम्पलेट्स बना सकते हैं!
T max(T)(T a, T b) {
    if(a < b)
        return b;

    return a;
}

// संदर्भ द्वारा पारित सुनिश्चित करने के लिए रेफरी कीवर्ड का प्रयोग करें । यही कारण है कि यहां तक कि 'A' और 'B' , तो है
//मान प्रकार वे हमेशा ' swap()' के संदर्भ द्वारा पारित हो जाएगा  हैं ।
void swap(T)(ref T a, ref T b) {
    auto temp = a;

    a = b;
    b = temp;
}

// टेम्पलेट्स के साथ, हम भी मूल्यों पर परमेटेराइज़  कर सकते हैं , न सिर्फ types.With टेम्पलेट्स, हम भी नहीं है, बस प्रकार , मूल्यों पर parameterize कर सकते हैं।
class Matrix(uint m, uint n, T = int) {
    T[m] rows;
    T[n] columns;
}

auto mat = new Matrix!(3, 3);
// Consider a class parameterized on types 'T' & 'U'.
class MyClass(T, U) {
    T _data;
    U _other;
}

// And "getter" and "setter" methods like so:
class MyClass(T, U) {
    T _data;
    U _other;

    // भवन निर्माताओं हमेशा नामित कर रहे हैं 'this'.
    this(T t, U u) {
        //यह नीचे सेटर तरीकों से मुलाकात करेंगे।
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

//और हम इस तरह से उन का उपयोग करें :
void main() {
    auto mc = new MyClass!(int, string)(7, "seven");

    // करने के लिए लिखने के लिए मानक पुस्तकालय से
    // आयात ' stdio ' मॉड्यूल
    // सांत्वना (आयात एक गुंजाइश के लिए स्थानीय हो सकता है) ।
    import std.stdio;

    // Call the getters to fetch the values.
    writefln("Earlier: data = %d, str = %s", mc.data, mc.other);

    // Call the setters to assign new values.
    mc.data = 8;
    mc.other = "eight";

    // Call the getters again to fetch the new values.
    writefln("Later: data = %d, str = %s", mc.data, mc.other);
}
import std.algorithm : map, filter, reduce;
import std.range : iota; // builds an end-exclusive range

void main() {
    // हम भी ints के वर्गों की एक सूची का योग मुद्रित करना चाहते हैं
    // 1 से 100 के लिए आसान करने के लिए!

    // बस टेम्पलेट पैरामीटर के रूप में लैम्ब्डा भाव के पास!
    // आप आप की तरह किसी भी पुराने समारोह पारित कर सकते हैं , लेकिन lambdas यहाँ सुविधाजनक हैं।
    auto num = iota(1, 101).filter!(x => x % 2 == 0)
                           .map!(y => y ^^ 2)
                           .reduce!((a, b) => a + b);

    writeln(num);
}
import std.stdio;
import std.parallelism : parallel;
import std.math : sqrt;

void main() {
    // हम हमारे सरणी में वर्गमूल हर नंबर ले जाना चाहता हूँ ,
    // हम उपलब्ध है के रूप में और के रूप में कई कोर का लाभ ले।
    auto arr = new double[1_000_000];

    // संदर्भ के द्वारा एक सूचकांक , और एक सरणी तत्व का प्रयोग
    // और सिर्फ सरणी पर समानांतर फोन!
    foreach(i, ref elem; parallel(arr)) {
        ref = sqrt(i + 1.0);
    }
}
