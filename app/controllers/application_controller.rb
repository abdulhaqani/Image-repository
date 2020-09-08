class ApplicationController < ActionController::Base
  @@current_image = 0
  helper_method :current_user, :logged_in?, :same_user, :same_user_users, :set_current_image, :get_current_image

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def same_user
    if current_user != @image.user
      flash[:notice] = "Invalid Credentials"
      redirect_to images_path
    end
  end

  def same_user_users
    if !(current_user == @user)
      flash[:notice] = "Invalid Credentials"
      redirect_to images_path
    end
  end

  def set_current_image
    @@current_image = @image.id
  end
  def get_current_image
    return @@current_image
  end
end