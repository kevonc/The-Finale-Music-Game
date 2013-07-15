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
    $("ul#answers li").children().hide()
    answer = $(this).text()
    $(".message").append('<div class="btn btn-correct">You answered ' + answer + '. Correct! 10 Points granted!</div>')
  $("div .incorrect").click ->
    $(this).addClass "btn-incorrect"
    $("ul#answers li").children().hide()
    answer = $(this).text()
    $(".message").append('<div class="btn btn-incorrect">You answered ' + answer + '. Wrong! Try harder! </div>')
