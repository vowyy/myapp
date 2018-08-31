class MealsController < ApplicationController
  before_action :meal_num_get, only: [:new, :create]
  before_action :get_meal, only: [:edit, :update, :destroy]
  before_action :element_selected?, only: :search

  def index
    if foreigner?
      @foreigner_all_meals      = current_foreigner.meals
      @foreigner_offered_meals  = current_foreigner.meals.select { |my_meal| my_meal.already_offered? && !my_meal.already_matched? }
      @foreigner_matched_meals  = current_foreigner.meals.select { |my_meal| my_meal.already_matched? }
    else
      @japanese_favor_meals   = current_japanese.favors.map {|my_favor| my_favor.meal }.delete_if { |meal| meal.already_matched? }
      @japanese_offered_meals = current_japanese.matches.where(ok: false).map { |my_offer| my_offer.meal }
      @japanese_matched_meals = current_japanese.matches.where(ok: true).map { |my_match| my_match.meal }
    end
    render layout: "personal_user"
  end

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
