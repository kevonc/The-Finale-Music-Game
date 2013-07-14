# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  array = $("#answers").children().get().sort(->
    0.5 - Math.random()
  )
  $("#answers").append array