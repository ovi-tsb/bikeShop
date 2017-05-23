class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

# adding field first_name  last_name to devise
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
# adding field first_name  last_name to devise
    
end
