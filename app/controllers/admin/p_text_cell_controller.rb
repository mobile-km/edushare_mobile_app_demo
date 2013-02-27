class Admin::PTextCellController < ApplicationController

  layout 'web_work'
  
  def index
    @p_text_cells = PTextCell.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @p_text_cells }
    end
  end

  def show

  end

  def new

  end

  def edit

  end

  def create

  end
  
  def update

  end

  def destroy

  end

end