class ForeignersController < ApplicationController
  def show
    render layout: "personal_user"
    @foreigner = Foreigner.find(params[:id])
  end
end
