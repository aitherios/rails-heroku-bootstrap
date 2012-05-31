$ ->
  popupCenter = (url, width, height, name) ->
    left = (screen.width / 2) - (width / 2)
    top = (screen.height / 2) - (height / 2)
    window.open url, name, "menubar=no,toolbar=no,status=no,width=#{width},height=#{height},toolbar=no,left=#{left},top=#{top}"

  ($ 'a.popup').click (e) ->
    link = $ this
    popupCenter link.attr('href'), link.attr('data-width'), link.attr('data-height'), 'authPopup'
    e.stopPropagation()
    e.preventDefault()
