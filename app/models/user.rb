class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true, presence: true
  
  enum role: [:patient, :doctor, :admin]
  after_initialize do
    if self.new_record?
      self.role ||= :patient
    end
  end

  def gravatar_url()
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    url = "https://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
