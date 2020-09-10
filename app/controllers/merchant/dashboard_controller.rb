class Merchant::DashboardController < Merchant::BaseController
  def index
    @user = User.find(params[:id])
  end
end
