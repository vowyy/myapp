class PagesController < ApplicationController
  before_action :new_arrival_meals
  skip_before_action :authenticate!

  def home
    @q = Meal.ransack(params[:q])
    @english_meals = Meal.joins(:foreigner).where(foreigners: { flng_id: 1 }).distinct.limit(4)
  end

  def search_meals
    @q = Meal.ransack(params[:q])
  end

  def search_meals_result
    @q = Meal.search(search_params)
    @q.sorts = "created_at #{@created_at}" if @q.sorts.empty?
    @search_meals_result = @q.result.includes(:location, :foreigner).page(params[:page]).per(8)
    render 'search_meals'
  end

  def praivacy; end

  def term; end

  def contact; end

  def contact_send
    @name    = params[:name]
    @email   = params[:email]
    @inquiry = params[:inquiry]

    if [@name, @email, @inquiry].map(&:blank?).include?(true)
      flash.now[:warning] = if request.referer.split("/")[-2] == "en"
                              "Blank form can not be accepted."
                            else
                              "全て記入してください。"
                            end
      # ここでエラー？というか日本語と英語のflashがごちゃ混ぜになる。
      render "contact"
    else

      ContactMailer.contact_send(@name, @email, @inquiry).deliver_now

      flash[:success] = if request.referer.split("/")[-2] == "en"
                          "Your contact was successfully sent."
                        else
                          "お問い合わせを送信しました。"
                        end
      redirect_to root_path(locale: params[:locale])
    end
  end

  private

  def new_arrival_meals
    @new_meals = Meal.limit(4).order("created_at DESC")
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
