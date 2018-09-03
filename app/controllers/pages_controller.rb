class PagesController < ApplicationController
  before_action :you_foreigner?, only: :jhome
  before_action :you_japanese?, only: :home
  before_action :new_arrival_meals

  def home;end

  def jhome
    @q = Meal.ransack(params[:q])
    @english_meals = Meal.joins(:foreigner).where(foreigners: { flng_id: 1 }).distinct.order("RAND()").limit(4)
  end

  def search_meals
    @q = Meal.ransack(params[:q])
  end

  def search_meals_result
    @q = Meal.search(search_params)
    @q.sorts = "created_at #{@created_at}" if @q.sorts.empty?
    @search_meals_result = @q.result.includes(:location, :foreigner)
    render 'search_meals'
  end

  def praivacy;end
  def jpraivacy;end

  def term;end
  def jterm;end

  def contact;end
  def jcontact;end

  def contact_send
    @name    = params[:name]
    @email   = params[:email]
    @inquiry = params[:inquiry]

    if [@name, @email, @inquiry].map(&:blank?).include?(true)
      if request.referer.split("/").last == "jcontact"
        flash.now[:warning] = "全て記入してください。"
        render :jcontact
      else
        flash.now[:warning] = "Blank form can not be accepted."
        render :contact
      end
    else
      
      ContactMailer.contact_send(@name, @email, @inquiry).deliver_now

      if request.referer.split("/").last == "jcontact"
        flash[:success] = "お問い合わせを送信しました。"
        redirect_to jhome_path
      else
        flash[:success] = "Your contact was successfully sent."
        redirect_to root_path
      end
    end
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
    if !params[:q].nil?
      @created_at = params[:q][:created_at]
      params.require(:q).permit(:foreigner_flng_id_eq, :location_id_eq, :date_eq, :time_eq, :crated_at)
    else
      @created_at = params[:created_at]
      params.permit(:foreigner_flng_id_eq, :created_at)
    end
  end
end
