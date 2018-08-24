class MealsController < ApplicationController
  before_action :meal_num_get, only: [:new, :create]
  before_action :get_meal, only: [:edit, :update, :destroy]

  def show; end

  def new
    @meal = Meal.new
    Meal.all.each {|meal| meal.destroy if meal.date.past? }
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

  def update
    if @meal.update(meal_params)
      flash[:success] = "Meal was successfully updated"
      redirect_to rooms_path
    else
      render 'edit'
    end
  end

  def destroy
    if @meal.room.nil?
      Meal.find(@meal.id).destroy
      flash[:success] = "Meal was successfully deleted"
    end
    redirect_to rooms_path
  end

  private

  def meal_params
    params.require(:meal).permit(:date, :time, :location_id, :male, :female, :skype)
  end

  def get_meal
    @meal = Meal.find(params[:id])
  end

  def meal_num_get
    unless Meal.size_over?(current_foreigner)
      flash[:alert] = "Sorry. Maximum posts are five."
      redirect_to root_path
    end
  end
end
