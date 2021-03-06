class Doctor < ApplicationRecord
    belongs_to :user

    def self.getallnames
        namepairs = {}
        Doctor.all.each do |doctor|
            user = User.find_by(id: doctor.user_id)
            name = user.first_name+" "+user.last_name
            namepairs[name] = doctor.user_id
        end
        return namepairs
    end
end
