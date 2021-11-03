class RoomChannel < ApplicationCable::Channel
  def subscribed
    puts "subscribed"
    room = Room.find params[:room]
    stream_for room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
