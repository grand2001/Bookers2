class ApplicationController < ActionController::Base
 before_action :authenticate_user!, except: [:top, :about, :new_user_session, :new_user_registration]
 before_action :configure_permitted_parameters, if: :devise_controller?


def after_sign_in_path_for(resource)
  flash[:noice] = "Welcome! You have signed up successfully."
  user_path(current_user.id)
end

def after_sign_out_path_for(resource)
  flash[:noice] = "signed out successfully."
  root_path
end


 private

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up,keys: [:email])
  end
end
