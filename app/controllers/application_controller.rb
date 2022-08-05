class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def search_area
    if params[:address].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
    else
      @rooms = Room.none
    end
  end

  def search_keyword
    if params[:room_title, :room_body].present?
      @rooms= User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @rooms = Room.none
    end
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :about, :user_image])
  end

end