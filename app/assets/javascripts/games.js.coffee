# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".move").on 'click', (event) ->
    
    if $(this).text() == "Cancel"
      $(this).text("Move").css("background-color", "blue")
      $( ".hidden" ).append( $(".move-icon") )
    else

      $(this).text("Cancel").css("background-color", "red")

      id = $(this).parent().attr("id")
      x = parseInt(id.substring(0, id.indexOf('-')))
      y = parseInt(id.substring(id.indexOf('-')+1, id.length))
      rate = parseInt($("#movement_rate").val())

      for x_cord in [(x-rate)..(x+rate)]
        for y_cord in [(y-rate)..(y+rate)]
          if x_cord != x or y_cord != y
            $( "#" + x_cord + "-" + y_cord ).append( $(".move-icon").first().clone() )
            $(".move-icon").on 'click', (event) ->
              id = $(this).parent().attr("id")
              x = parseInt(id.substring(0, id.indexOf('-')))
              y = parseInt(id.substring(id.indexOf('-')+1, id.length))
              $( this ).find("#id").val( $("#current_army_id").val()  )
              $( this ).find("#army_x_cord").val(x)
              $( this ).find("#army_y_cord").val(y)
              $( this ).find("form").attr("action", "/move/" + $("#current_army_id").val())
              $( this ).find("[method='post']").submit()
              event.stopPropagation()

  # move the comment section to the bottom (the latest comments)
  elem = $('.comment-section')
  elem.scrollTop(elem.height() * 2)

  # hide the user id input at first
  $("#whisper").hide()

  $("#comment_comment_type").on 'change', (event) ->
    if $(this).val() == "whisper"
      $("#whisper").show()
    else
      $("#whisper").hide()

  $(".is_winner").each (event) ->
    if $(this).val() == "1"
      value == 0
    else
      value == 1
    $(this).parent().next().val(value)

  $(".is_winner").on 'change', (event) ->
    if $(this).val() == "1"
      value == 0
    else
      value == 1
    $(this).parent().next().val(value)
