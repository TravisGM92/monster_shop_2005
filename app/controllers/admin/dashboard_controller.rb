class Admin::DashboardController < Admin::BaseController
  before_action :require_admin

  def index
    @orders = Order.order(status: :asc)
  end

  def ship_it
    order = Order.find(params[:id])
    order.ship
    redirect_to '/admin/'
  end

  private
  def require_admin
    render file: "/public/404" unless current_admin?
  end


end
