class MessageReadedJob < ApplicationJob
  queue_as :default

  def perform(message)
    ReaderChannel.broadcast_to(message.sender, message.id)
  end

  # private

  # def render_partial(message)
  #   MessagesController.renderer.render partial: "messages/message",
  #                                       locals: { message: message, current_user: message.sender }
  # end
end
