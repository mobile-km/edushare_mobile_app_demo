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
  # 增加属性表单
  $attrs = jQuery('.page-admin-show .child-cells .attrs')
  $attrs.find('.add-new-attr').click ->

    jQuery('<div class="item"></div>')
      .append(jQuery('<input type="text" size="20" name="keys[]" />'))
      .append(jQuery('<input type="text" size="20" name="values[]" />'))
      .appendTo(jQuery(this).closest('.attrs').children('.add-attr').children('form').children('.attr-list'))