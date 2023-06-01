class AppearanceJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    @pseudo=args[0]
    #@message=args[1]
    ActionCable.server.broadcast("chat_Best Room", @pseudo.as_json.merge({updated_at: I18n.l(@pseudo.updated_at),email:@pseudo.user.try(:email)}))
  end
end
