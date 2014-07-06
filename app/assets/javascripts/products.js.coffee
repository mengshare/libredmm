uri_params = () ->
  params = {}
  for token in location.search.substring(1).split('&')
    pair = token.split('=')
    params[pair[0]] = pair[1]
  params

window.uri_params = uri_params

ready = ->
  params = uri_params()
  for k, v of params
    if !!v && k not in ['page', 'text_mode', 'utf8', 'commit']
      console.log k
      console.log v
      $('#advanced_search_box').collapse('show')
      break

$(document).ready(ready)
$(document).on('page:load', ready)