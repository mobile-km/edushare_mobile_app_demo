class Admin::PTextCellsController < ApplicationController
  before_filter :pre_load

  def pre_load
    @p_text_cell = PTextCell.find params[:id] if params[:id]
  end


  def index
    @p_text_cells = PTextCell.all
  end

  def new
    @p_text_cell = PTextCell.new
  end

  def create
    PTextCell.create(params[:p_text_cell])
    redirect_to "/admin/p_text_cells"
  end

  def show
  end


  def edit
  end

  def update

    if @p_text_cell.update_attributes(params[:p_text_cell])
      return redirect_to "/admin/p_text_cells"
    end

    error = @p_text_cell.errors.first
    flash[:error] = error[1]
    redirect_to "/admin/p_text_cells/#{@p_text_cell.id}/edit"
  end

  def destroy
    @p_text_cell.destroy
  end
end