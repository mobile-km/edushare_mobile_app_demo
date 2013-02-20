class HtmlDemoController < ApplicationController
  layout 'html_demo'
  def index
    render "/html_demo/#{params[:path]}"
  end

  def mobile_scenes
    @scene = Scene.mobile_scenes[params[:id].to_i]
    @navitem = NavItem.items[0]
    render "/html_demo/show_func"
  end
end