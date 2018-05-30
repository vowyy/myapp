class MatchesController < ApplicationController
  before_action :set_match, only: [:edit, :update]
  before_action :already_approved?, only: [:update]

  def create
    @match = current_japanese.matches.build(match_params)

    if @match.save
      flash[:success] = "食事リクエストを#{@match.meal.foreigner.name}さんに送信しました。"
      MatchMailer.meal_request(@match).deliver_now
    else
      flash[:alert] = "失敗"
    end
    redirect_to root_path
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

  # これ必要か？userに直接入力してもらうことは特になく、ボタン押すだけ。
  def match_params
    params.permit(:budget, :meal_id)
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
