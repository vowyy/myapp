class RoomsController < ApplicationController
  before_action :valid_users, only: [:show]

  def index
    if foreigner?
      @foreigner_all_meals       = current_foreigner.meals
      @foreigner_offered_meals   = current_foreigner.meals.select { |my_meal| my_meal.already_offered? && !my_meal.already_matched? }
      @foreigner_matched_meals   = current_foreigner.meals.select { |my_meal| my_meal.already_matched? }
    else
      @japanese_favor_meals   = current_japanese.favors.map {|my_favor| my_favor.meal }.delete_if { |meal| meal.already_matched? }
      @japanese_offered_meals = current_japanese.matches.where(ok: false).map { |my_offer| my_offer.meal }
      @japanese_matched_meals = current_japanese.matches.where(ok: true).map { |my_match| my_match.meal }
    end
    render layout: "personal_user"
  end

  def show
    @rooms = japanese? ? Room.where(japanese_id: current_japanese) : Room.where(foreigner_id: current_foreigner)
    @messages = @room.messages
    store_location
  end

  private

  def valid_users
    if Room.exists?(id: params[:id])
      @room = Room.find(params[:id])
      if foreigner?
        redirect_back(fallback_location: root_path) unless @room.foreigner.id == current_foreigner.id
      elsif japanese?
        redirect_back(fallback_location: jhome_path) unless @room.japanese.id == current_japanese.id
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

end
