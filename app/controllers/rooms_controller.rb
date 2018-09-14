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
        unless @room.foreigner == current_foreigner
          flash[:warning] = t('flash.wrong_access')
          redirect_back(fallback_location: root_path(locale: :en))
        end
      elsif japanese?
        unless @room.japanese == current_japanese
          flash[:warning] = t('flash.wrong_access')
          redirect_back(fallback_location: root_path)
        end
      end
    else
      flash[:warning] = t('flash.wrong_access')
      redirect_back(fallback_location: root_path)
    end
  end

end
