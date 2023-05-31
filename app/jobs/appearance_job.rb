class AppearanceJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    @pseudo=args[0]
    @message=args[1]
    ActionCable.server.broadcast("chat_Best Room", { sent_by: @pseudo.name,body: @message.content })
  end
end
