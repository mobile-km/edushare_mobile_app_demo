module ApplicationHelper
  def page_top_bar(title, back_to_href, options = {})
    render 'index/parts/page_top_bar', :title => title, 
                                       :href => back_to_href,
                                       :has_search => options[:has_search]
  end

  def page_top_nav(current)
    render 'index/parts/page_top_nav', :current => current
  end

  def page_bottom_nav
    render 'index/parts/page_bottom_nav'
  end

  def page_bottom_nav_entry(entry)
    render 'index/parts/page_bottom_nav_entry', :entry => entry
  end

  def page_bottom_nav_notebooks
    render 'index/parts/page_bottom_nav_notebooks'
  end
end
