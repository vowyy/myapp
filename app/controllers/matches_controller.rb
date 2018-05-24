class MatchesController < ApplicationController
  before_action :get_match, only: [:edit, :update]

  def create
    @match = current_japanese.matches.build(match_params)

    if @match.save
      flash[:success] = "食事リクエストを#{@match.meal.foreigner.name}さんに送信しました。"
      MatchMailer.meal_request(@match).deliver_now
      redirect_to root_path
    else
      flash[:alert] = "失敗"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @match.update(match_params)
      @match.toggle!(:ok)
      flash[:notice] = "Congratulations!"
      redirect_to root_path
    else
      render :edit
      flash[:alert] = "Try again."
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
    params.permit(:budget, :meal_id, :ok)
  end

  def get_match
    @match = Match.find(params[:id])
  end
end
