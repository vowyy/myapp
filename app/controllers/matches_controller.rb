class MatchesController < ApplicationController
  before_action :set_match, only: [:edit, :update]
  before_action :already_approved?, only: [:edit, :update]

  def create
    @meal = Meal.find(params[:meal_id])
    @match = current_japanese.matches.build(match_params)

    if @match.save
      flash[:success] = "食事リクエストを#{@match.meal.foreigner.name}さんに送信しました。承認されましたらメールでお知らせします。しばらくお待ちください"
      MatchMailer.meal_request(@meal, @match).deliver_now
    else
      flash[:alert] = "リクエストに失敗しました。もう一度やり直してください。"
    end
    redirect_to jhome_path
  end

  def edit; end

  def update
    if @match.update(ok: true)
      flash[:notice] = "Congratulations"
      redirect_to root_path
    end
  end

  def destroy
    Match.find(params[:id]).destroy
    flash[:notice] = "You successfully canceled request."
    redirect_to root_path
  end

  private

  def match_params
    params.require(:match).permit(:budget, :skype).merge(meal_id: params[:meal_id])
  end

  def set_match
    @match = Match.find(params[:id])
  end

  def already_approved?
    if @match.ok? && Room.exists?(match_id: @match.id)
      flash[:alert] = "You already approved request."
      redirect_to root_path
    end
  end
end
