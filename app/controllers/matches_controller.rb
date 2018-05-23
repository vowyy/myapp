class MatchesController < ApplicationController
  def create
    @match = current_japanese.matches.build(match_params)

    if @match.save
      flash[:success] = "食事リクエストを送りました。"
      MatchMailer.meal_request(@match).deliver_now
      redirect_to root_path
    else
      flash[:alert] = "失敗"
      redirect_to root_path
    end
  end

  private

  # これ必要か？userに直接入力してもらうことは特になく、ボタン押すだけ。
  def match_params
    params.permit(:budget, :meal_id)
  end
end
