class User::BillingController < User::BaseController
  def index
    @reservations = current_user.reservations
  end
end
