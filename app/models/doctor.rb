class Doctor < ApplicationRecord
    belongs_to :user

    def self.getallnames
        names = []
        Doctor.all.each do |doctor|
            user = User.find_by(id: doctor.user_id)
            name = user.first_name+" "+user.last_name
            names = names + [name]
        end
        return names
    end
end
