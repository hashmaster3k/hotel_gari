class UsersController < ApplicationController
  def new

  end

  def create
    new_user = User.create(user_params)
    session[:user_id] = new_user.id
    redirect_to user_profile_path
  end

  private
  def user_params
    params.permit(:username,
                  :password,
                  :first_name,
                  :last_name,
                  :address,
                  :city,
                  :state,
                  :zip)
  end
end
