class IndexController < ApplicationController
  def index
    redirect_to '/texts/1'
  end

  def texts
    path = params[:path]
    if path.nil?
      @current_text_cell = TextCellParser.roots[0]
    else
      @current_text_cell = TextCellParser::TextCell.by_url path
    end

    render :layout => 'text_cell_document'
  end
end