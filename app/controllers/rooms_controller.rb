class RoomsController < ApplicationController
  def index
    render layout: "personal_foreigner"
    @rooms = japanese? ? Room.where(japanese_id: current_japanese) : Room.where(foreigner_id: current_foreigner)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = @room.messages.build
    store_location
  end
end
