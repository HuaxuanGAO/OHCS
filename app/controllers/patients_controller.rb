class PatientsController < ApplicationController
    def profile
        if user_signed_in?
            @patient = current_user
        end
    end

    def index
        @patient = Patient.all
    end

    def editinfo
        @patient = current_user
    end

    def update
        @patient = current_user
        @patient.update(update_params)
        flash[:notice] = "#{@patient.username} profile was successfully updated."
        redirect_to "/patients/#{@patient.id}/profile"
    end

    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def update_params
        params.require(:patient).permit(:last_name, :first_name, :gender, :birthday)
    end
end
