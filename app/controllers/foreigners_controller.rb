class ForeignersController < ApplicationController
  def show
    render layout: "personal_foreigner"
    @foreigner = Foreigner.find(params[:id])
  end
end
