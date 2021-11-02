class DoctorsController < ApplicationController
    before_action :authenticate_doctor!
    def profile
        if doctor_signed_in?
            @doctor = current_doctor
        end
    end

    def index
        @doctors = Doctor.all
    end
    
    def editinfo
        @doctor = current_doctor
    end

end
