class MessageSenderJob < ApplicationJob
  queue_as :default

  def perform(message)
    MessageChannel.broadcast_to(message.receiver, data: render_partial(message), id: message.id)
  end

  private

  def render_partial(message)
    MessagesController.renderer.render partial: "messages/message",
                                        locals: { message: message, current_user: message.receiver }
  end
end
