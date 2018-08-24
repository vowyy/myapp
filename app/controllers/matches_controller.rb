class MatchesController < ApplicationController
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
    redirect_back(fallback_location: jhome_path)
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
    flash[:notice] = "You successfully canceled this match."
    redirect_to root_path
  end

  private

  def match_params
    params.require(:match).permit(:budget, :skype).merge(meal_id: params[:meal_id])
  end

  def set_match
    if Match.exists?(params[:id])
      @match = Match.find(params[:id])
    else
      flash[:alert] = "This offer has been deleted."
      redirect_to root_path
    end
  end

  def already_approved?
    if @match.ok? && Room.exists?(match_id: @match.id)
      flash[:alert] = "You already approved offer."
      redirect_to root_path
    end
  end
end
