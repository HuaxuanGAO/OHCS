require 'google/apis/sheets_v4'
require 'googleauth' 

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  validates :username, uniqueness: true, presence: true
  has_one :patient, dependent: :destroy
  has_one :doctor, dependent: :destroy
  after_save :init_patient_or_doctor
  
  # attr_accessor :session

  enum role: [:patient, :doctor, :admin]
  after_initialize do
    if self.role == "patient"
      # viewer authentication
      auth("ohcs-332322-00e17d389980.json")
      
    elsif self.role == "doctor"
      # editor authentication
      auth("ohcs-332322-2d31bc21ae94.json")
    end
    if self.new_record?
      self.role ||= :patient
    end
  end

  def auth(sessionfile)
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(sessionfile))
    
    authorizer
  end

  def gravatar_url()
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    url = "https://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def init_patient_or_doctor
    if self.role == "patient"
      patient = Patient.create
      # Creates a session. This will prompt the credential via command line for the
      # first time and save it to config.json file for later usages.
      # See this document to learn how to create config.json:
      # https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
      session = GoogleDrive::Session.from_service_account_key("ohcs-332322-2d31bc21ae94.json")
      mytitle = "ss_"+patient.id.to_s
      ss = session.create_spreadsheet(title= mytitle)
      ws = ss.add_worksheet(title="ws_"+patient.id.to_s)
      begin
        ws.insert_rows(1, [["Id", "Symptom", "Date", "Doctor"]])
        ws.save
        erb :thanks
      rescue
        erb :index, locals: {
          error_message: "Your details could not be saved, please try again."
        }
      end
      patient.update_attribute(:med_record, ws.human_url)
      self.patient = patient
    elsif self.role == "doctor"
      doctor = Doctor.create
      self.doctor = doctor
    end
  end    
end
