class UsersController < ApplicationController
    def profile
        if user_signed_in?
            @user = current_user
        end
    end

    def index
        @user = User.all
    end

    def editinfo
        @user = current_user
    end

    def update
        @user = current_user
        @user.update(update_params)
        flash[:notice] = "#{@user.username} profile was successfully updated."
        redirect_to "/users/#{@user.id}/profile"
    end

    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def update_params
        params.require(:user).permit(:last_name, :first_name, :gender, :birthday)
    end
end
