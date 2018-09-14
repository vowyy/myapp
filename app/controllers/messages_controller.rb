class MessagesController < ApplicationController
  before_action :valid_user, only: :destroy

  def create
    message = current_user.messages.build(message_params)
    flash[:notice] = "メッセージを入力してください。" unless message.save
    redirect_back_or(root_path)
  end

  def destroy
    Message.find(params[:id]).destroy
    redirect_to room_path(params[:room_id])
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(room_id: params[:room_id])
  end

  def valid_user
    if current_user_exists? && Message.exists?(id: params[:id])
      @message = Message.find(params[:id])
      unless @message.messable == current_user
        redirect_back(fallback_location: root_path(locale: :en))
        flash[:warning] = t('flash.wrong_access')
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
