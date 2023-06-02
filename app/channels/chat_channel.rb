class ChatChannel < ApplicationCable::Channel
  def subscribed
    #stream_from "chat_#{params[:room]}"
    pseudo = Pseudo.find(params[:id])
    stream_for pseudo
  end
    def receive(data)
      pseudo=Pseudo.find data["pseudo_id"]
      mydata={"username":pseudo.name, email: pseudo.user.try(:email),description: pseudo.user.try(:description), image: pseudo.user.try(:image), content: data["content"]}
    ActionCable.server.broadcast("chat_#{params[:room]}", mydata)
  end

     def unsubscribed
          #Unsubscribes all streams associated with this channel from the pubsub queue.
       stop_all_streams
     end
end
