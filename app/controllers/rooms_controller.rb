class RoomsController < ApplicationController
  before_action :valid_users, only: [:show]

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
