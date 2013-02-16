class HtmlDemoController < ApplicationController
  layout false
  def index
    render "/html_demo/#{params[:path]}"
  end
end