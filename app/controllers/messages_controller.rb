class MessagesController < ApplicationController
  def create
    message = current_user.messages.build(message_params)
    flash[:notice] = "メッセージを入力してください。" unless message.save
    redirect_back_or(root_path)
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id)
  end
end
