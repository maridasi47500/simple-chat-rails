
App.cable.subscriptions.create("AppearanceChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
$('[data-pseudoid="'+data["id"]+'"] img').attr('src',data['image']);
$('[data-pseudoid="'+data["id"]+'"] .title').html(data['name']);
$('[data-pseudoid="'+data["id"]+'"] .description').html(data['description']);
$('[data-pseudoid="'+data["id"]+'"] .modification').html('dernière modification '+data['updated_at']);
  }
});
