jQuery ->
  $mark = jQuery('.page-b3 .mark')
  $link = $mark.find('.important a')
  $count = $mark.find('.count')

  $num = $count.data 'count'

  $count.html("已标记"+$num+"次")
  $link.click ->
    $num = $num + 1
    $count.html("已标记"+$num+"次")