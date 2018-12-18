@set_theme = (theme_value) ->
    document.getElementById('pagestyle').setAttribute 'href', '/css/' + theme_value + '.css'
    localStorage.setItem 'lxiym_theme', theme_value
    return

@set_theme_user = (theme_value_user) ->
    if theme_value_user.length
      set_theme theme_value_user
    return

@set_theme_storage = ->
    theme_value_storage = localStorage.getItem('lxiym_theme')
    if theme_value_storage.length
      set_theme theme_value_storage
    return

do set_theme_storage
