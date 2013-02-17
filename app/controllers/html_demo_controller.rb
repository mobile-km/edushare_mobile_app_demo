class HtmlDemoController < ApplicationController
  layout 'html_demo'
  def index
    render "/html_demo/#{params[:path]}"
  end
end