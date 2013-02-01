module ApplicationHelper
  def page_top_bar(title, back_to_href)
    render 'index/parts/page_top_bar', :title => title, 
                                       :href => back_to_href
  end

  def page_top_nav(current)
    render 'index/parts/page_top_nav', :current => current
  end

  def page_bottom_nav
    render 'index/parts/page_bottom_nav'
  end
end
