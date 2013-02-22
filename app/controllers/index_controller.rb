class IndexController < ApplicationController
  def index
    redirect_to '/html_demo/index.html'
  end

  def texts
    path = params[:path]
    if path.nil?
      @current_text_cell = TextCellParser.roots[0]
    else
    end

    render :layout => 'texts'
  end
end