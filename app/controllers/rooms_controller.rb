class RoomsController < ApplicationController
  def index
    @rooms = japanese? ? Room.where(japanese_id: current_japanese) : Room.where(foreigner_id: current_foreigner)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
    store_location
  end
end
