$.rails.allowAction = (element) ->
    message = element.data('confirm')# The message is something like "Are you sure?"
    return true unless message # If there's no message, there's no data-confirm attribute, which means there's nothing to confirm
    $link = element.clone() # Clone the clicked element (probably a delete link) so we can use it in the dialog box.
      .removeAttr('class') # We don't necessarily want the same styling as the original link/button.
      .removeAttr('data-confirm') # We don't want to pop up another confirmation (recursion)
      .addClass('btn').addClass('btn-danger') # We want a button
      .html("Yes, I'm positively certain.")# We want it to sound confirmy
    # Create the modal box with the message
    modal_html = """
                 <div class="modal" id="myModal">
                   <div class="modal-header">
                     <a class="close" data-dismiss="modal">×</a>
                     <h3>#{message}</h3>
                   </div>
                   <div class="modal-body">
                     <p>Be certain, sonny.</p>
                   </div>
                   <div class="modal-footer">
                     <a data-dismiss="modal" class="btn">Cancel</a>
                   </div>
                 </div>
                 """
    $modal_html = $(modal_html)
    $modal_html.find('.modal-footer').append($link)# Add the new button to the modal box
    $modal_html.modal()# Pop it up
    # Prevent the original link from working
    return false

$ ->
  App.appTooltip()
  App.showCalendar()

App =
  appTooltip: ->
    $("img#avatar-1").each ->
      $(@).tooltip({ placement: 'right' })

    $("a").each ->
      $(@).tooltip()

    $("img").each ->
      $(@).tooltip({ placement: 'bottom' })

    $(".card span").each ->
      $(@).tooltip({ placement: 'bottom' })


  showCalendar: ->
    $("[data-behaviour~='datepicker']").on "mouseover", (event) ->
      $(@).datepicker({"format": 'yyyy-mm-dd', "weekStart": 1, "autoclose": true})





