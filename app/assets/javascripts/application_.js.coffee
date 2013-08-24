$.rails.allowAction = (element) ->
    message = element.data('confirm')
    return true unless message
    $link = element.clone()
      .removeAttr('class')
      .removeAttr('data-confirm')
      .addClass('btn').addClass('btn-danger')
      .html("Yes, I'm positively certain.")

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
    $modal_html.find('.modal-footer').append($link)
    $modal_html.modal()
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







