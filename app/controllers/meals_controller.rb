class MealsController < ApplicationController
  before_action :only_foreigner, except: :index
  before_action :deserve_to_create_meal?, except: :index
  before_action :meal_num_get, only: [:new, :create]
  before_action :find_meal, only: [:edit, :update, :destroy]

  def index
    if foreigner?
      @foreigner_all_meals      = current_foreigner.meals
      @foreigner_offered_meals  = current_foreigner.meals.select { |my_meal| my_meal.already_offered? && !my_meal.already_matched? }
      @foreigner_matched_meals  = current_foreigner.meals.select(&:already_matched?)
    else
      @japanese_favor_meals   = current_japanese.favors.map(&:meal).delete_if(&:already_matched?)
      @japanese_offered_meals = current_japanese.matches.where(ok: false).map(&:meal)
      @japanese_matched_meals = current_japanese.matches.where(ok: true).map(&:meal)
    end
    render layout: "personal_user"
  end

  def new
    @meal = Meal.new
    Meal.all.each { |meal| meal.destroy if meal.date.past? }
  end

  def create
    @meal = current_foreigner.meals.build(meal_params)

    if @meal.save
      flash[:notice] = "meal succesfully created!!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @meal.update(meal_params)
      flash[:success] = "Meal was successfully updated"
      redirect_to meals_path
    else
      render 'edit'
    end
  end

  def destroy
    if @meal.room.nil?
      Meal.find(@meal.id).destroy
      flash[:success] = "Meal was successfully deleted"
    end
    redirect_to meals_path
  end

  private

  def only_foreigner
    unless foreigner?
      flash[:warning] = t('flash.wrong_access')
      redirect_back(fallback_location: root_path)
    end
  end

  def deserve_to_create_meal?
    if current_foreigner.there_lack_attributes?
      flash[:warning] = "Please complete your profile or introduction."
      redirect_to edit_foreigner_registration_path
    end
  end

  def meal_num_get
    unless Meal.size_over?(current_foreigner)
      flash[:alert] = "Sorry. Maximum posts are five."
      redirect_to root_path
    end
  end

  def meal_params
    params.require(:meal).permit(:date, :time, :location_id, :male, :female, :skype)
  end

  def find_meal
    @meal = Meal.find(params[:id])
  end
end
