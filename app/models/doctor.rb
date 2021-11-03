class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true, presence: true

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end
end

# class Doctor::ParameterSanitizer < Devise::ParameterSanitizer
#   def initialize(*)
#     super
#     permit(:sign_up, keys: [:username, :email, :last_name, :first_name, :gender])
#   end
# end