class RoomsController < ApplicationController
  before_action :valid_users, only: [:show]

  def index
    @foreigner_all_meals       = current_foreigner.meals if foreigner?
    @foreigner_offered_meals   = current_foreigner.meals.select { |meal| meal.already_offered? && !meal.already_matched? } if foreigner?
    @foreigner_matched_meals   = current_foreigner.meals.select { |meal| meal.already_matched? } if foreigner?

    @japanese_favor_meals   = current_japanese.favors.map {|my_favor| my_favor.meal }.delete_if { |meal| meal.already_matched? } if japanese?
    @japanese_offered_meals = current_japanese.matches.where(ok: false).map { |my_match| my_match.meal } if japanese?
    @japanese_matched_meals = current_japanese.matches.where(ok: true).map { |my_match| my_match.meal } if japanese?
    render layout: "personal_user"
  end

  def show
    @rooms = japanese? ? Room.where(japanese_id: current_japanese) : Room.where(foreigner_id: current_foreigner)
    @room  = Room.find(params[:id])
    @messages = @room.messages
    store_location
  end

  private

  def valid_users
    @room = Room.find(params[:id])
    if foreigner?
      redirect_back(fallback_location: root_path) unless @room.foreigner.id == current_foreigner.id
    elsif japanese?
      redirect_back(fallback_location: jhome_path) unless @room.japanese.id == current_japanese.id
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
