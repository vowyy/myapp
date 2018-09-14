class FavorsController < ApplicationController
  def create
    Favor.create(meal_id: params[:meal_id], japanese_id: current_japanese.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Favor.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
