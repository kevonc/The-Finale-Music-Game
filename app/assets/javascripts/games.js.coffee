# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  array = $("#answers").children().get().sort(->
    0.5 - Math.random()
  )
  $("#answers").append array

$(document).ready ->
  $("div #correct").click ->
    $(this).addClass "btn-correct"
    $("div .incorrect").addClass "btn-incorrect"
    $("ul#answers li").hide()
    answer = $(this).text()
    $(".message").append('<div class="ans corrans">You answered ' + answer + '. Correct! 10 Points granted!<br>Loading the next level...</div>')
    $("ul#answers li").children().unbind()
  $("div .incorrect").click ->
    $("div .incorrect").addClass "btn-incorrect"
    $("div #correct").addClass "btn-correct"
    $("ul#answers li").hide()
    answer = $(this).text()
    $(".message").append('<div class="ans incorrans">You answered ' + answer + '. Wrong! Try harder!<br>Loading the next level...</div>')
    $("ul#answers li").children().unbind()
