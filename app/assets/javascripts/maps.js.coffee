# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$ ->
  #$(".space").on 'click', (event) ->
  #  id = $(this).attr("id")
  #  x = id.substring(0, id.indexOf('-'))
  #  y = id.substring(id.indexOf('-')+1, id.length)
  #  alert(x + " " + y)

$ ->
  $(".map-container").height($(".map-container").width())
