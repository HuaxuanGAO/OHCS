class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one :room, dependent: :destroy
  after_create :init_room
  after_save :set_room 

  def init_room
    room = Room.create()
    self.room = room
  end
  
  def set_room
    self.room.update(name: self.name)
  end
end
