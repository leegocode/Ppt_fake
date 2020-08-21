import consumer from "./consumer"

const chatChannel = consumer.subscriptions.create(
  {
    channel: "ChatChannel",
    room: "Best Room"
  },
  {
    received(data) {
      console.log(data);
    }
  }
)

chatChannel.send({ sent_by: "Paul", body: "This is a cool chat app." })
