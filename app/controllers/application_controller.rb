class ApplicationController < ActionController::Base
 # require_relative 'boot'
  require 'rails/all'
  Bundler.require(*Rails.groups)
  
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


module TazkiyahMvp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

def authenticate_active_admin_user!
   authenticate_user!
   unless current_user.role?(:admin)
      flash[:alert] = "You are not authorized to access this resource!"
      redirect_to root_path
   end
end

end
