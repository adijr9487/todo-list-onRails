class UsersController < ApplicationController

  def index
    if user_signed_in?
      redirect_to users_path
    else
      redirect_to new_users_session_path
    end
  end

  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def authenticate_user!
    return unless current_user.nil?

    redirect_to new_user_session_path
  end
end
