# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
  
  # Initialize the part of the form where you can select a previous sendee
  if $ "#recipient_from_select"
    select = $ "#recipient_from_select"
    select.change ->
      if select.val()
        $("#recipient_from_input").hide()
      else
        $("#recipient_from_input").show()
