class MealsController < ApplicationController
  def show
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = current_foreigner.meals.build(meal_params)

    if @meal.save
    else
     render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def meal_params
    params.require(:meal).permit(:date_time, :in, :p_num, :lang)
  end
end
