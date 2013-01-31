jQuery ->
  $add_to_notebook_link = jQuery('.page-b3 .notebook-link a')
  $toast = jQuery('.page-b3 .toast')
  $dialog = jQuery('.page-b3 .note-dialog')
  $notebook_submit = $dialog.find('.submit a')
  $notebook_cancel = $dialog.find('.cancel a')

  $add_to_notebook_link.click -> $dialog.fadeIn()
  $notebook_submit.click ->
    $dialog.fadeOut()
    $toast.fadeIn().delay(1000).fadeOut()

  $notebook_cancel.click -> $dialog.fadeOut()
