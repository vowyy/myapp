class MealsController < ApplicationController
  before_action :meal_num_get, only: :create

  def show; end

  def new
    @meal = Meal.new
  end

  def create
    @meal = current_foreigner.meals.build(meal_params)

    if @meal.save
      flash[:notice] = "meal succesfully created!!"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def meal_num_get
    unless Meal.size_over?(current_foreigner)
      flash[:alert] = "Sorry. Maximum posts are three. Your post was deleted."
      redirect_to root_path
    end
  end

  def meal_params
    params.require(:meal).permit(:date, :time, :location_id, :male, :female)
  end

end
