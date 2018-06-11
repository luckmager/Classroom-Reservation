class RegistrationsController < Devise::RegistrationsController  
    respond_to :json
    before_action :configure_permitted_parameters, :only => [:create]

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:email, :password, :role) }
    end
end  