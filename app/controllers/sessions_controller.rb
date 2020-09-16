class SessionsController < ApplicationController
  def new

  end

  def create
    if user = User.find_by(username: params[:username])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_profile_path
      else
        flash[:error] = "Password is incorrect."
        render :new
      end
    else
      flash[:error] = "Username is incorrect or does not exist."
      render :new
    end



  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out."
    redirect_to :root
  end
end
