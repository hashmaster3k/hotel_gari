class User::ProfileController < User::BaseController
  def index
    @date = Date.today
  end

  def show

  end

  def edit
    @user = current_user
  end

  def update
    current_user.update_user_information(user_params)
    flash[:success] = "Update information successfully"
    redirect_to user_profile_info_path
  end

  private
  def user_params
    params.require(:user).permit(:username,
                                 :first_name,
                                 :last_name,
                                 :address,
                                 :city,
                                 :state,
                                 :zip)
  end
end
