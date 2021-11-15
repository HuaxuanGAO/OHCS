class Message < ApplicationRecord
  belongs_to :room, inverse_of: :messages
  belongs_to :user
  def as_json(options)
    super(options).merge(user_avatar_url: user.gravatar_url)
  end
end
