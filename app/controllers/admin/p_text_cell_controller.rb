class Admin::PTextCellController < ApplicationController
  before_filter :pre_load

  def pre_load
    @text_cell = PTextCell.find params[:id] if params[:id]
  end


  def index
    @p_text_cells = PTextCell.all
  end

  def new
    @text_cell = PTextCell.new
  end


  def create
    PTextCell.create(params[:text_cell])
    redirect_to "/admin/p_text_cell"
  end

  def show
  end


  def edit
  end

  def update
    @text_cell.update_attributes(params[:p_text_cell])

    if @text_cell.update_attributes(params[:p_text_cell])
      return redirect_to "/admin/p_text_cell"
    end

    error = @text_cell.errors.first
    flash[:error] = error[1]
    redirect_to "/admin/p_text_cell/#{@text_cell.id}/edit"
  end

  def destroy
    @text_cell.destroy
  end
end