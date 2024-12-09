// बुनियादी एएमडी एपीआई दो तरीकों लेकिन कुछ भी नहीं होते : `define` और `require`
// और सभी मॉड्यूल परिभाषा और खपत के बारे में है :
// `define` एक मॉड्यूल को परिभाषित करता है
// `require` निर्भरता का एक सेट का आयात करता है और
// पारित कर दिया कॉलबैक में उन्हें सेवन करती है

// एक नया नाम देकर हम मॉड्यूल को परिभाषित करने का उपयोग करके शुरू करते हैं
// जिसकी कोई निर्भरता है । हम एक नाम से गुजर रहा है ऐसा करेंगे
// और एक कारखाने समारोह को परिभाषित करने के लिए :
define('awesomeAMD', function(){
  var isAMDAwesome = function(){
    return true;
  };
// एक मॉड्यूल के कारखाने समारोह की मान है
  // जब प्राप्त होगा क्या अन्य मॉड्यूल या आवश्यकता कॉल
  // हमारे `awesomeAMD` मॉड्यूल की आवश्यकता होती है ।
  // निर्यात मूल्य कुछ भी हो सकता है, (निर्माता ) काम करता है,
  // वस्तुओं, पुरातन, (जो कि बहुत ज्यादा मदद नहीं करेगा , हालांकि) भी अपरिभाषित ।
  return isAMDAwesome;
});

// अब, हमारे `awesomeAMD` मॉड्यूल पर निर्भर करता है कि किसी अन्य मॉड्यूल परिभाषित करते हैं।
// हमारे परिभाषित करने के लिए एक अतिरिक्त तर्क है कि नोटिस
अब // मॉड्यूल की निर्भरता :
define('loudmouth', ['awesomeAMD'], function(awesomeAMD){
// निर्भरता कारखाने के तर्कों को पारित हो जाएगा
  // क्रम में वे निर्दिष्ट कर रहे हैं
  var tellEveryone = function(){
    if (awesomeAMD()){
      alert('This is sOoOo rad!');
    } else {
      alert('Pretty dull, isn\'t it?');
    }
  };
  return tellEveryone;
});

// हम अब परिभाषित का उपयोग करने के लिए कैसे जानते हैं के रूप में, के लिए `require` का उपयोग करते हैं
// हमारे कार्यक्रम बंद किक । `require` के हस्ताक्षर है :(arrayOfDependencies, callback)`.
require(['loudmouth'], function(loudmouth){
  loudmouth();
});

// इस ट्यूटोरियल रन कोड बनाने के लिए है, चलो एक बहुत ही बुनियादी लागू करते हैं
// (गैर अतुल्यकालिक ) की मौके पर यहीं एएमडी के संस्करण:
function define(name, deps, factory){
// निर्भरता के बिना मॉड्यूल नियंत्रित किया जाता है कैसे नोटिस
  define[name] = require(factory ? deps : [], factory || deps);
}

function require(deps, callback){
  var args = [];
 // पहले की जरूरत है सभी निर्भरता पुनः प्राप्त करते हैं
  // आवश्यकता कॉल द्वारा
  for (var i = 0; i < deps.length; i++){
    args[i] = define[deps[i]];
  }
// सभी कॉलबैक की निर्भरता को संतुष्ट
  return callback.apply(null, args);
}
// आप यहाँ कार्रवाई में इस कोड को देख सकते हैं: http://jsfiddle.net/qap949pd/
/* file: app/main.js */
require(['modules/someClass'], function(SomeClass){
  // निर्भरता लोड होने तक कॉलबैक टाल दिया गया है
  var thing = new SomeClass();
});
console.log('So here we are, waiting!'); // this will run first
/* file: app/modules/someClass.js */
define(['daos/things', 'modules/someHelpers'], function(thingsDao, helpers){
  // module definition, of course, will also happen asynchronously
  function SomeClass(){
    this.method = function(){/**/};
    // ...
  }
  return SomeClass;
});
/* file: main.js */
requirejs.config({
  baseUrl : 'app',
  paths : {
    // आप भी अन्य स्थानों से मॉड्यूल लोड कर सकते हैं
    jquery : '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min',
    coolLibFromBower : '../bower_components/cool-lib/coollib'
  }
});
require(['jquery', 'coolLibFromBower', 'modules/someHelpers'], function($, coolLib, helpers){
  //एक `main` फ़ाइल में कम से कम एक बार की आवश्यकता को फोन करने की जरूरत है,
  // अन्यथा कोई कोड कभी चलेंगे
  coolLib.doFancyStuffWith(helpers.transform($('#foo')));
});
<!DOCTYPE html>
<html>
<head>
  <title>A hundred script tags? Never again!</title>
</head>
<body>
  <script src="require.js" data-main="app/main"></script>
</body>
</html>
$ npm install requirejs -g
$ r.js -o app.build.js
/* file : app.build.js */
({
  name : 'main', // प्रवेश बिंदु के नाम
  out : 'main-built.js', // फ़ाइल का नाम करने के लिए उत्पादन में लिखने के लिए
  baseUrl : 'app',
  paths : {
    // ` empty :` का उपयोग कर , यह अभी भी समन्वय से लोड किया जाना चाहिए कि r.js बताता है
    // main.js में निर्दिष्ट स्थान
    jquery : 'empty:',
    coolLibFromBower : '../bower_components/cool-lib/coollib'
  }
})
<script src="require.js" data-main="app/main-built"></script>
