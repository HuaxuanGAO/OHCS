class UsersController < ApplicationController

    def profile
        if user_signed_in?
            @user = current_user
            if @user.role == "patient" 
                @patient = Patient.find_by(user_id: @user.id)
            elsif @user.role == "doctor" 
                @doctor = Doctor.find_by(user_id: @user.id)
            end 
        end
    end

    def index
        @user = User.all
    end

    def editinfo
        @user = current_user
        if @user.role == "patient" 
            @patient = Patient.find_by(user_id: @user.id)
        elsif @user.role == "doctor" 
            @doctor = Doctor.find_by(user_id: @user.id)
        end
    end

    def update
        @user = current_user
        @user.update(update_params)
        if @user.role == "patient" 
            @patient = Patient.find_by(user_id: @user.id)
            patient_update_params = params.require(:user).require(:patient_attributes).permit(:med_record)
            @patient.update(patient_update_params)
        elsif @user.role == "doctor" 
            @doctor = Doctor.find_by(user_id: @user.id)
        end
        flash[:notice] = "#{@user.username} profile was successfully updated."
        redirect_to "/users/#{@user.id}/profile"
    end

    def med_record
        @user = current_user
    end

    def appointments
        @user = current_user
    end

    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def update_params
        params.require(:user).permit(:last_name, :first_name, :gender, :birthday)
    end
end
