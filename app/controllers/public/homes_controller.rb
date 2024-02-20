class Public::HomesController < ApplicationController
  before_action :authenticate_user!
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
