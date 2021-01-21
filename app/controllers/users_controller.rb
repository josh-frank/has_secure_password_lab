class UsersController < ApplicationController

  before_action :must_be_logged_in, only: :show

  helper_method :current_user
  
  def new
    @new_user = User.new
  end

  def create
    @new_user = User.create( user_params )
    if @new_user.valid?
      session[ :user_id ] = @new_user.id
      redirect_to user_path( @new_user )
    else
      flash[ :messages ] = @new_user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
  end

  private

  def user_params
    params.require( :user ).permit( :name, :password, :password_confirmation )
  end

end
