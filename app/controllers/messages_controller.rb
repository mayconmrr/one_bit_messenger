class MessagesController < ApplicationController
  before_action :set_message, only: :update

  def create
    @message = current_user.sent.build(receiver_id: params[:chat_id])
    @message.attributes = params.require(:message).permit(:content)
    @message.save
    render :create
  end

  def update
    @message.update(readed_at: DateTime.now)
  end

  private

  def set_message
    @message = Message.find(message_params[:id])
  end

  def message_params
    params.require(:message).permit(:id)
  end
end
