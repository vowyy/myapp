class ForeignersController < ApplicationController
  def show
    @foreigner = Foreigner.find(params[:id])
  end
end
