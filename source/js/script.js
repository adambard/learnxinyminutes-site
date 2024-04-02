(function() {
  $(function() {
    return $('#lang-select').change(function() {
      var lang;
      lang = $(this).val();
      return $('td.lang a').each(function() {
        if ($(this).text() === lang) {
          return $(this).addClass("selected");
        } else {
          return $(this).removeClass("selected");
        }
      });
    });
  });

}).call(this);
