class ChatJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    @pseudo=args[0]
    @post=args[1]
    p @post, "THIS IS MY POST"
    ChatChannel.broadcast_to(@pseudo,@post)
  end
end
