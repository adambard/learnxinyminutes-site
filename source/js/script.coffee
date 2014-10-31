$ ->
    $('#lang-select').change ->
        lang = $(this).val()
        $('td.lang a').each ->
            if $(this).text() == lang
                $(this).addClass("selected")
            else
                $(this).removeClass("selected")

