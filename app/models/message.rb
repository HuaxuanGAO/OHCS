class Message < ApplicationRecord
  belongs_to :room, inverse_of: :messages
  belongs_to :user
  def as_json(options)
    # TODO: nil instance in test cases
    super(options).merge(user_avatar_url: User.find(1).gravatar_url)
  end
end