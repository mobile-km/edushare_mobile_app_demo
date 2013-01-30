class E2Controller < ApplicationController
  def index
    id = params[:id] || 1
    @notebook = Notebook.all[id - 1]
  end
end
