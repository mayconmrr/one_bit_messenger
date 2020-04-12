import consumer from "./consumer"

consumer.subscriptions.create("ReaderChannel", {
  connected() {
    console.log("Conected at ReaderChannel")
  },

  received(data) {
    let messageIcon = document.getElementById('message_icon_' + data)
    if (typeof(messageIcon) != 'undefined' && messageIcon != null) {
      messageIcon.innerHTML = '<i class="fas fa-check has-text-black-ter"></i>'
    }
  }
});
