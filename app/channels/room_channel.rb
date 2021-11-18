class RoomChannel < ApplicationCable::Channel
  def subscribed    
    if Room.exists?(id: params[:room])
      room = Room.find params[:room]
      stream_for room
      puts "subscribed #{params}"
    else
      puts "room DNE #{params}"
      reject
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
