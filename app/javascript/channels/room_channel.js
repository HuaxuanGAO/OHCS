import consumer from "./consumer"

console.log("room channel js file loaded")

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("connected");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("received", data);
    // Called when there's incoming data on the websocket for this channel
  }
});

$(function() {
  console.log("func");
  $('[data-channel-subscribe="room"]').each(function(index, element) {
    var $element = $(element);
    var room_id = $element.data('room-id');
    var messageTemplate = $('[data-role="message-template"]');

    console.log("room id: ", room_id);

    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)        

    consumer.subscriptions.create(
      {
        channel: "RoomChannel",
        room: room_id
      },
      {
        received: function(data) {
          var content = messageTemplate.children().clone(true, true);
          content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
          content.find('[data-role="message-text"]').text(data.message);
          content.find('[data-role="message-date"]').text(data.updated_at);
          $element.append(content);
          $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
        }
      }
    );
  });
});

$(function() {
  $('#new_message').on('ajax:success', function(a, b,c ) {
    $(this).find('input[type="text"]').val('');
  });
});