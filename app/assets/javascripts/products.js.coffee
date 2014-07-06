ready = ->
  if location.search
    $('#advanced_search_box').collapse('show')

$(document).ready(ready)
$(document).on('page:load', ready)