class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"

  end
  
    def receive(data)
      pseudo=Pseudo.find data["id"]
      mydata={"username":pseudo.name, email: pseudo.user.try(:email),description: pseudo.user.try(:description), image: pseudo.user.try(:image)}
    ActionCable.server.broadcast("chat_#{params[:room]}", mydata)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
