module TextCellHelper

  def text_cell_simple_format(text)
    text1 = simple_format(text)
    return text1.gsub('<p>', '<p>　　').gsub('<br />', '<br />　　').html_safe
  end

end