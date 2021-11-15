class MessagesController < ApplicationController
    before_action :load_entities
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
  
    def create
      # TODO change this line
      @room_message = Message.create user: current_user,
                                     room: @room,
                                     message: params.dig(:message, :message)
      RoomChannel.broadcast_to @room, @room_message
    end
  
    protected
  
    def load_entities
      @room = Room.find params.dig(:message, :room_id)
    end
end