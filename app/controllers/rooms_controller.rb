class RoomsController < ApplicationController
  def index
    @rooms = japanese? ? Room.where(japanese_id: current_japanese.id) : Room.where(foreigner_id: current_foreigner.id)
  end

  def show
    @room = Room.find(params[:id])
    @messages = Message.all
  end
end
