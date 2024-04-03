(function() {
  document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('lang-select').addEventListener('change', function() {
      var lang = this.value;
      var links = document.querySelectorAll('td.lang a');
      links.forEach(function(link) {
        if (link.textContent === lang) {
          link.classList.add('selected');
        } else {
          link.classList.remove('selected');
        }
      });
    });
  });
}).call(this);
