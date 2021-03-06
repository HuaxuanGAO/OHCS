class ApplicationController < ActionController::Base  
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :first_name, :last_name, :department, :birthday, :gender, :role])
    end

    def after_sign_in_path_for(resource)
        if current_user
            "/users/#{current_user.id}/profile" # your path
        else
            "/"
        end
    end
end
