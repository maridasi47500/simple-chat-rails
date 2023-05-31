class ChatJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    ChatChannel.broadcast_to(@pseudo,@post)
  end
end
