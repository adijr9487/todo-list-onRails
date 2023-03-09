class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    if user_signed_in?
        redirect_to '/users'
    else
        redirect_to new_user_session_path
    end
  end

  def show
    @user = current_user
  end

  def authenticate_user!
    return unless current_user.nil?

    redirect_to new_user_session_path
  end
end
