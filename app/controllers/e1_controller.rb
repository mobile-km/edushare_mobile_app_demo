class E1Controller < ApplicationController
  def index
    @notebooks = Notebook.all
  end
end
