class Room < ApplicationRecord
    has_many :messages, dependent: :destroy, inverse_of: :room
    belongs_to :appointment
end
