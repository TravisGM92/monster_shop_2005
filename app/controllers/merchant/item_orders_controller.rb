class Merchant::ItemOrdersController < Merchant::BaseController

  def update
    order = Order.find(params[:id])
    item = Item.find(params[:id])
    item_order = ItemOrder.find_by(item_id: params[:item_id], order_id: params[:order_id])
    item_order.update(status: "fulfilled")
    item.decrement!("inventory", by = item_order.quantity)
  end

end
