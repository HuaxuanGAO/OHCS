class RoomChannel < ApplicationCable::Channel
  def subscribed
    puts "subscribed #{params}"
    if Room.exists?(id: params[:room])
      room = Room.find params[:room]
      stream_for room
    else
      reject
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
