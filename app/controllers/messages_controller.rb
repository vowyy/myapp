class MessagesController < ApplicationController
  def create
    message = current_user.messages.build(message_params)
    if message.save
      redirect_back_or(root_path)
    else
      redirect_back_or(root_path)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content,:room_id)
  end
end
