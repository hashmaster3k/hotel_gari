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
    if current_user.update(user_params)
      flash[:success] = 'Update information successfully'
      redirect_to user_profile_info_path
    else
      flash[:error] = 'Error: One or more fields was empty'
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
