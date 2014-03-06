# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.preview = (content) ->
  $('#preview').html textile $(content).val()
  MathJax.Hub.Queue(["Typeset",MathJax.Hub])

ready = ->
  MathJax.Hub.Queue(["Typeset",MathJax.Hub])
  $(document).on 'keyup', (e) ->
    LEFT = 37
    RIGHT = 39
    new_location = undefined
    if LEFT == e.keyCode
       new_location = $('.action:contains("Prev")').attr 'href'
    else if RIGHT == e.keyCode
       new_location = $('.action:contains("Next")').attr 'href'
    if new_location
      self.location = new_location
      false
    else
      true


$(document).ready ready
$(document).on 'page:load', ready

