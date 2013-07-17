# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".add-fav").submit ->
    $(".fav-message").append('<div class="ans corrans center">You have favorited this track. Check your favorite list after game!</div>')
    $(".fav-message").delay(1500).fadeOut('slow')
    valuesToSubmit = $(this).serialize()
    $.ajax(
      url: $(this).attr("action")
      data: valuesToSubmit
      dataType: "JSON"
      type: "POST"
    ).success (json) ->
      return false