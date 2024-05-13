(function() {
  document.addEventListener('DOMContentLoaded', function() {
    var langSelect = document.getElementById('lang-select');
    if (!langSelect) {
      return
    }

    function set_lang(lang) {
      langSelect.value = lang

      var links = document.querySelectorAll('td.lang a');
      links.forEach(function(link) {
        if (link.textContent === lang) {
          link.classList.add('selected');
        } else {
          link.classList.remove('selected');
        }
      });
    }

    var LANG_KEY = "lxiym_lang";
    function load_lang() {
      var lang = localStorage.getItem(LANG_KEY);
      if (lang) {
        set_lang(lang);
      }
    }

    load_lang();
    // Backup: do it onload. Will blink, but better than nothing.
    window.onload = function(){
      load_lang();
    };

    langSelect.addEventListener('change', function() {
      var lang = this.value;
      set_lang(lang);
      localStorage.setItem(LANG_KEY, lang);
    });
  });
}).call(this);
