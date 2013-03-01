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
  $attrs = jQuery('.page-model-form .attrs')
  $new = $attrs.find('.item.new').clone()


  $attrs.find('.add-new-attr').click ->
    $attrs.append $new.clone()