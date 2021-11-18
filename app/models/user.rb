class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true, presence: true
  has_one :patient, dependent: :destroy
  has_one :doctor, dependent: :destroy
  accepts_nested_attributes_for :doctor, :patient
  after_create :init_patient_or_doctor
  
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

  def init_patient_or_doctor
    if self.role == "patient"
      patient = Patient.create
      # src = 'https://docs.google.com/spreadsheets/d/1y1OY7VpP1VY_O9XHssmUsA0o9UePcjSRmmKpYSEOf1c/edit?usp=sharing'
      # patient.update_attribute(:med_record, src)
      self.patient = patient
    elsif self.role == "doctor"
      doctor = Doctor.create
      self.doctor = doctor
    end
  end    
end
