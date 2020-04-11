import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    console.log("Conected at MessageChannel")
  },

  received(data) {
    let messageContainer = document.querySelector("div.message-container");
    if (typeof(messageContainer) != 'undefined' && messageContainer != null) {
      console.log(data['id'])
      messageContainer.innerHTML += data['data'];
      messageContainer.scrollIntoView(false);

      var params = { message: { id: data['id']} }
      $.ajax ({
        url: '/messages/:id',
        type: 'PUT',
        dataType: 'SCRIPT',
        data: params
      });
    }
  }
});
