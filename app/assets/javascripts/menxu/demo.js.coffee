jQuery ->
  $mark = jQuery('.page-b3 .mark')
  $link = $mark.find('.important a')
  $count = $mark.find('.count')

  $num = $count.data 'count'

  $count.html("已标记"+$num+"次")
  $link.click ->
    $num = $num + 1
    $count.html("已标记"+$num+"次")


jQuery ->
  $attrs = jQuery('.page-admin-show .child-cells .attrs')
  $add = $attrs.find('.add a')
  $add_attr = $attrs.find('.add-attr')

  $add.click ->
    jQuery(this).parent().children(jQuery('.add-attr')).css({display:'inline'})
