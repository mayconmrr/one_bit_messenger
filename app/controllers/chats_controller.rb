class ChatsController < ApplicationController
  after_action :update_readed_at, only: :show

  def index
    @users = User.joins(:sent).where(messages: { receiver_id: current_user })
    @users += User.joins(:received).where(messages: { sender_id: current_user })
    @users.uniq!
  end

  def show
    @user = User.find(params[:id])
    @messages = Message.where(sender: current_user, receiver: @user)
                       .or(Message.where(sender: @user, receiver: current_user))
                       .order(:created_at).includes(:receiver, :sender)
  end

  private

  def update_readed_at
    messages = Message.where(sender: @user, receiver: current_user, readed_at: nil)
    messages.update(readed_at: DateTime.now)
    messages.each { |message| MessageReadedJob.perform_now(message) }
  end
end
