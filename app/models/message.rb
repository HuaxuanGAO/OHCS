class Message < ApplicationRecord
  belongs_to :room, inverse_of: :messages
  belongs_to :patient
  belongs_to :doctor
  def as_json(options)
    super(options).merge(user_avatar_url: patient.gravatar_url)
  end
end
