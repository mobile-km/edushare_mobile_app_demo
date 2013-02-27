class Admin::PTextCellsController < ApplicationController
  layout 'web_work'
  before_filter :pre_load
  layout 'web_work'
  def pre_load
    @p_text_cell = PTextCell.find params[:id] if params[:id]
  end

  def index
    @p_text_cells = PTextCell.roots
  end

  def new
    @p_text_cell = PTextCell.new
  end

  def create
    PTextCell.create(params[:p_text_cell])
    redirect_to "/admin/p_text_cells"
  end

  def show
    @child_cells = PTextCell.find(@p_text_cell.id).children
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
    redirect_to :back
  end
end