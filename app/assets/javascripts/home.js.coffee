# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@preview = (content) ->
  $('#preview').html textile $(content).val()
  MathJax.Hub.Queue(["Typeset",MathJax.Hub])

ready = =>
  MathJax.Hub.Queue(["Typeset",MathJax.Hub])
  do @keyboard.setupKeyboard

$(document).ready ready
$(document).on 'page:load', ready

