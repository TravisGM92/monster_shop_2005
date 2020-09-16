class Merchant::DashboardController < Merchant::BaseController
  def index
    # @user = User.find(params[:id])
    @merchant_employee = current_user
  end
end
