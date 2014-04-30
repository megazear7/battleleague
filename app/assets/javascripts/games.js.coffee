# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".move").on 'click', (event) ->
    
    if $(this).text() == "Cancel"
      $(this).text("Move").css("background-color", "blue")
      $( ".hidden" ).append( $(".left-move") )
      $( ".hidden").append( $(".right-move") )
      $( ".hidden" ).append( $(".up-move") )
      $( ".hidden" ).append( $(".down-move") )
    else

      $(this).text("Cancel").css("background-color", "red")

      id = $(this).parent().attr("id")
      x = id.substring(0, id.indexOf('-'))
      y = id.substring(id.indexOf('-')+1, id.length)
      $( ".hidden" ).append( $(".left-move") )
      $( ".hidden").append( $(".right-move") )
      $( ".hidden" ).append( $(".up-move") )
      $( ".hidden" ).append( $(".down-move") )
      $( "#" + (parseInt(x)-1) + "-" + y ).append( $(".left-move") )
      $( "#" + (parseInt(x)+1) + "-" + y ).append( $(".right-move") )
      $( "#" + x + "-" + (parseInt(y)+1) ).append( $(".up-move") )
      $( "#" + x + "-" + (parseInt(y)-1) ).append( $(".down-move") )

  $(".left-move").on 'click', (event) ->
    id = $(this).parent().attr("id")
    x = parseInt(id.substring(0, id.indexOf('-')))
    y = parseInt(id.substring(id.indexOf('-')+1, id.length))
    $( this ).find("#id").val( $("#current_army_id").val()  )
    $( this ).find("#army_x_cord").val(x)
    $( this ).find("#army_y_cord").val(y)
    $( this ).find("form").attr("action", "/move/" + $("#current_army_id").val())
    $( this ).find("[method='post']").submit()
    event.stopPropagation()

  $(".right-move").on 'click', (event) ->
    id = $(this).parent().attr("id")
    x = parseInt(id.substring(0, id.indexOf('-')))
    y = parseInt(id.substring(id.indexOf('-')+1, id.length))
    $( this ).find("#id").val( $("#current_army_id").val()  )
    $( this ).find("#army_x_cord").val(x)
    $( this ).find("#army_y_cord").val(y)
    $( this ).find("form").attr("action", "/move/" + $("#current_army_id").val())
    $( this ).find("[method='post']").submit()
    event.stopPropagation()

  $(".up-move").on 'click', (event) ->
    id = $(this).parent().attr("id")
    x = parseInt(id.substring(0, id.indexOf('-')))
    y = parseInt(id.substring(id.indexOf('-')+1, id.length))
    $( this ).find("#id").val( $("#current_army_id").val()  )
    $( this ).find("#army_x_cord").val(x)
    $( this ).find("#army_y_cord").val(y)
    $( this ).find("form").attr("action", "/move/" + $("#current_army_id").val())
    $( this ).find("[method='post']").submit()
    event.stopPropagation()
   
  $(".down-move").on 'click', (event) ->
    id = $(this).parent().attr("id")
    x = parseInt(id.substring(0, id.indexOf('-')))
    y = parseInt(id.substring(id.indexOf('-')+1, id.length))
    $( this ).find("#id").val( $("#current_army_id").val()  )
    $( this ).find("#army_x_cord").val(x)
    $( this ).find("#army_y_cord").val(y)
    $( this ).find("form").attr("action", "/move/" + $("#current_army_id").val())
    $( this ).find("[method='post']").submit()


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





