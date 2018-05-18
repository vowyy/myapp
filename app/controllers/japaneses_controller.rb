class JapanesesController < ApplicationController
  def show
    @japanese = Japanese.find(params[:id])
  end
end
