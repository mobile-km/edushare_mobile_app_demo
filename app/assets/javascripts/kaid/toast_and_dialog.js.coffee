jQuery ->
  $add_to_notebook_link = jQuery('.page-bottom-nav .add-note, .page-b2 .add-note')
  $toast = jQuery('.toast')
  $dialog = jQuery('.note-dialog')
  $notebook_submit = $dialog.find('.submit a')
  $notebook_cancel = $dialog.find('.cancel a')

  $add_to_notebook_link.click -> $dialog.fadeIn()
  $notebook_submit.click ->
    $dialog.fadeOut()
    $toast.fadeIn().delay(1000).fadeOut()

  $notebook_cancel.click -> $dialog.fadeOut()
