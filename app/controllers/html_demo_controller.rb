class HtmlDemoController < ApplicationController
  layout false
  def index
    render "/html_demo/#{params[:path]}.haml"
  end
end