
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_patient
    end

    private

    def find_verified_patient
      if verified_patient = Patient.find_by(id: cookies.signed['patient.id'])
        verified_patient
      else
        reject_unauthorized_connection
      end
    end
  end
end