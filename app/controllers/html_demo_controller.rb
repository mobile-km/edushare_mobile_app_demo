class HtmlDemoController < ApplicationController
  layout 'html_demo'
  def index
    render "/html_demo/#{params[:path]}"
  end

  def mobile_scenes
    render "/html_demo/show_func"
  end
end