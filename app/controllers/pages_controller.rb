class PagesController < ApplicationController
  before_action :you_foreigner?, only: :jhome
  before_action :you_japanese?, only: :home
  before_action :new_arrival_meals

  def home;end

  def jhome
    @english_meals = Meal.joins(:foreigner).where(foreigners: { flng_id: 1 }).distinct.order("RAND()").limit(4)
  end

  def search_meals
    @q = Meal.ransack(params[:q])
  end

  def search_meals_result
    @q     = Meal.search(search_params)
    @search_meals_result = @q.result.includes(:location, :foreigner)
    render 'search_meals'
  end

  private

  def new_arrival_meals
    @new_meals = Meal.limit(4).order("created_at DESC")
  end

  def you_foreigner?
    redirect_to root_path if foreigner?
  end

  def you_japanese?
    redirect_to jhome_path if japanese?
  end

  def search_params
    params.require(:q).permit!
  end
end
