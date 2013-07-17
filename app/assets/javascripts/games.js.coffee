# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  array = $("#answers").children().get().sort(->
    0.5 - Math.random()
  )
  $("#answers").append array

$(document).ready ->
  $(".submit-answer").submit (e) ->
    form = this
    e.preventDefault()
    setTimeout (->
      form.submit()
    ), 1700 # in milliseconds
  $("div .correct").click (e) ->
    #  $(this).addClass "btn-correct"
    #  $("div .incorrect").addClass "btn-incorrect"
    $("ul#answers li").hide()
    $(".question").hide()
    answer = $(this).text()
    $(".message").append('<div class="ans corrans center">You answered <span class="corrans-highlight">' + answer + '</span>. Correct! 15 Points granted!<br>Loading the next level...</div>')
    # $("ul#answers li").children().unbind()
  $("div .incorrect").click (e) ->
    #  $("div .incorrect").addClass "btn-incorrect"
    #  $("div .correct").addClass "btn-correct"
    $("ul#answers li").hide()
    $(".question").hide()
    answer = $(this).text()
    $(".message").append('<div class="ans incorrans center">You answered <span class="incorrans-highlight">' + answer + '</span>. Wrong! Try harder!<br>Loading the next level...</div>')
    # $("ul#answers li").children().unbind()