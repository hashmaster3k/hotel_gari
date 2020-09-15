class User::ProfileController < User::BaseController
  def index
    @date = Date.today
  end

  def show
    @user = current_user
  end

  def edit

  end
end
