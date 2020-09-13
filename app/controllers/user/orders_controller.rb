class User::OrdersController < User::BaseController

  def index

  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    order = Order.find(params[:id])
    order.status = "cancelled"
    order.save

    redirect_to '/profile'
    flash[:notice] = "Your order has been cancelled"
  end

end
