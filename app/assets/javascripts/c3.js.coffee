jQuery ->
  jQuery('.page-bottom-nav.entry .nav.mark-important').on 'click', ->
    return if jQuery(this).hasClass('red')
    $important = jQuery('.page-b3 .important')
    count = $important.data('count')
    $important.data('count',count+1)
    $important.find('.count').text(count+1)
    console.log(0 == count)
    $important.slideDown() if 0 == count
    jQuery(this).addClass('red')
      


    
