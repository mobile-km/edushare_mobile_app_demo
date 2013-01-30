class E2Controller < ApplicationController
  def index
    id = params[:id].to_i || 1
  end
end
