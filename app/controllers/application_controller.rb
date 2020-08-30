class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller? 

	 def after_sign_in_path_for(reource)
	 	 user_path(reource)

	 end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email,:name])
    end
end
