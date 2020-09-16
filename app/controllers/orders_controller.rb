class OrdersController < ApplicationController

  def new

  end

  def show
    @order = Order.find(params[:id])
  end

  def show_orders
    @orders = current_user.orders
  end

  def create
    order = current_user.orders.create(order_params)
    if order.save
      cart.items.each do |item,quantity|
        new_quantity = (item.inventory - quantity)
        item_to_take = Item.find(item.id)
        item_to_take.update(inventory: new_quantity)
        order.item_orders.create({
          item: item,
          quantity: quantity,
          price: item.price
          })
      end
      session.delete(:cart)
      flash[:success] = "Your order has been submitted"
      redirect_to "/profile/orders"
    else
      flash[:notice] = "Please complete address form to create an order."
      render :new
    end
  end

  def cancel
    order = current_user.orders.find(params[:id])
    order.update(status: "cancelled")
    item_order = ItemOrder.where(order_id: params[:id])
    item_order.each do |item|
      item_to_restock = Item.find(item.item_id)
      new_quantity = (item.quantity + item_to_restock.inventory)
      item_to_restock.update(inventory: new_quantity)
      item_order.update(status: "unfulfilled")
    end
    flash[:success] = "Your order has been cancelled"
    redirect_to("/profile")
  end

  private

  def order_params
    params.permit(:name, :address, :city, :state, :zip, :status)
  end
end
