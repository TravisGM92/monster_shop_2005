class Order < ApplicationRecord

  validates_presence_of :name, :address, :city, :state, :zip

  has_many :item_orders
  has_many :items, through: :item_orders
  belongs_to :user

  enum status: %w(pending packaged shipped cancelled)

  def grandtotal
    item_orders.sum('price * quantity')
  end

  def total_quantity
    item_orders.sum('quantity')
  end

end

# Item.join(:item_orders)
# .select('items.id, sum(item_order.quantity) AS total', 'items.name')
# .where('item_orders.item_id = items.id')
# .group('items.id')
# .order('total desc')
# .limit(5)
