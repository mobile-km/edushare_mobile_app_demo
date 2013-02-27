class Admin::PTexCellController < ApplicationController
  before_filter :per_load

  def per_load
    @text_cell = PTextCell.find params[:id] if params[:id]
  end


  def index
    @text_cells = PTextCell.all
  end

  def show
  end


  def edit
  end

  def update
    @text_cell.update_attributes(params[:p_text_cell])

    if @text_cell.update_attributes(params[:p_text_cell])
      return redirect_to "/admin/text_cell"
    end

    error = @text_cell.errors.first
    flash[:error] = error[1]
    redirect_to "/admin/text_cell/#{@text_cell.id}/edit"
  end

  def destroy
    @text_cell.destroy
  end
end