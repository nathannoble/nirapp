# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#post_search").on("ajax:success", (e, data, status, xhr) ->
    $("#main_grid").html xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#post_search").append "<p>ERROR</p>"
