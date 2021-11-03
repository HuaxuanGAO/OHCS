class MessagesController < ApplicationController
    before_action :load_entities
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token
  
    def create
      # TODO change this line
      @room_message = Message.create patient: current_patient,
                                     doctor: current_doctor || Doctor.find(1),
                                     room: @room,
                                     message: params.dig(:message, :message)
      RoomChannel.broadcast_to @room, @room_message
    end
  
    protected
  
    def load_entities
      @room = Room.find params.dig(:message, :room_id)
    end
end