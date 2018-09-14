class MatchesController < ApplicationController
  before_action :is_japanese?, only: :create
  before_action :deserve_to_offer_meal?, only: :create
  before_action :set_match, only: [:edit, :update]
  before_action :already_approved?, only: [:edit, :update]

  def create
    @meal = Meal.find(params[:meal_id])
    @match = current_japanese.matches.build(match_params)

    if @match.save
      flash[:success] = "食事オファーを#{@match.meal.foreigner.name}さんに送信しました。承認されましたらメールでお知らせします。しばらくお待ちください"
      MatchMailer.meal_offer(@meal, @match).deliver_now
    else
      flash[:alert] = "オファーに失敗しました。もう一度やり直してください。"
    end
    redirect_back(fallback_location: root_path)
  end

  def edit; end

  def update
    if @match.update(ok: true)
      Match.where(meal_id: @match.meal_id).map {|match| match.destroy if match.id != @match.id }
      flash[:notice] = "Congratulations"
      redirect_to room_path(@match.room.id)
    end
  end

  def destroy
    Match.find(params[:id]).destroy
    flash[:notice] = t('flash.cancell_offer')
    if japanese?
      redirect_to root_path
    else
      redirect_to root_path(locale: :en)
    end
  end

  private

  def is_japanese?
    unless japanese?
      flash[:warning] = t('flash.wrong_access')
      redirect_back(fallback_location: root_path)
    end
  end

  def deserve_to_offer_meal?
    if current_japanese.there_lack_attributes?
      flash[:warning] = "ミールにオファーするにはプロフィール、または自己紹介文を完成させてください。"
      redirect_to edit_japanese_registration_path
    end
  end

  def match_params
    params.require(:match).permit(:budget, :skype).merge(meal_id: params[:meal_id])
  end

  def set_match
    if Match.exists?(params[:id])
      @match = Match.find(params[:id])
    else
      flash[:alert] = "This offer has been deleted."
      redirect_to root_path(locale: :en)
    end
  end

  def already_approved?
    if @match.ok? && Room.exists?(match_id: @match.id)
      flash[:alert] = "You already approved offer."
      redirect_to root_path(locale: :en)
    end
  end
end
