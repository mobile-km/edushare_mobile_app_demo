module ApplicationHelper
  def page_top_nav(current)
    render 'index/parts/page_top_nav', :current => current
  end
end
