class MessagesController < ApplicationController
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
end
