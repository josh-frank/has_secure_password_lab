class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user = User.find( session[ :user_id ] )
  end

  def logged_in?
    !session[ :user_id ].nil?
  end

  def must_be_logged_in
    redirect_to login_path if !logged_in?
  end

end
