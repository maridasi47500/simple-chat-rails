class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_#{params[:room]}"

  end
  
    def receive(data)
      pseudo=Pseudo.find data["id"]
      mydata={"username":pseudo.name, email: pseudo.user.try(:email),description: pseudo.user.try(:description), image: pseudo.user.try(:image)}
    ActionCable.server.broadcast("appearance_#{params[:room]}", mydata)
  end

   def unsubscribed
        #Unsubscribes all streams associated with this channel from the pubsub queue.
       stop_all_streams
   end
end
