class User::ProfileController < User::BaseController
  def index
    @date = Date.today
  end

  def show

  end

  def edit_info
    @user = current_user
  end

  def update_info
    if current_user.update(user_params)
      flash[:success] = 'Update information successfully'
      redirect_to user_profile_info_path
    else
      flash[:error] = current_user.errors.full_messages.first
      redirect_to user_profile_edit_path
    end
  end

  def edit_password
  end

  def update_password
    if current_user.update_attribute(:password, params[:password])
      flash[:success] = "Password successfully changed!"
      redirect_to user_profile_info_path
    else
      flash[:error] = current_user.errors.full_messages.first
      redirect_to user_profile_edit_path
    end
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
