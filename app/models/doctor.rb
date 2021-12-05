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

    def self.with_department(department_name)
        output = self.where(department: department_name)
        return output
    end

    def self.with_name(fullname)
        name = fullname.split
        doctor = User.where(first_name: name[0], last_name: name[1])
        output = self.where(department: department_name)
        return output
    end
end
