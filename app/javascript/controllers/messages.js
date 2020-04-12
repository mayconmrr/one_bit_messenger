document.addEventListener("turbolinks:load", function() {
  $("#text_area_message").keypress(function(e) {
    if (e.keyCode == 13 && !e.shiftKey) {
      e.preventDefault();

      let parts = window.location.href.split('/')
      let chat_id = parts[parts.length - 1]
      let url = chat_id + '/messages'

      let content = $('#text_area_message').val()
      let params = { message: { content: content } }

      $.ajax({
        url: url,
        type: 'POST',
        dataType: 'SCRIPT',
        data: params
      });
    }
  });
});
