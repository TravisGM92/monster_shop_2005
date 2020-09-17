class Merchant::DashboardController < Merchant::BaseController

  def index
    @merchant_employee = current_user
  end

end
