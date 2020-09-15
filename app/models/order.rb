class Order < ApplicationRecord

  validates_presence_of :name, :address, :city, :state, :zip

  has_many :item_orders
  has_many :items, through: :item_orders
  belongs_to :user

  # enum status: %w(pending packaged shipped cancelled)

  def grandtotal
    item_orders.sum('price * quantity')
  end

  def total_quantity
    item_orders.sum('quantity')
  end
  #
  def update_status_to_cancelled
    self.update(status: "cancelled")
  end

  # def sort_val
  #   return 0 if self.status = 'packaged'
  #   return 1 if self.status = 'pending'
  #   return 2 if self.status = 'shipped'
  #   return 3 if self.status = 'canceled'
  # end

end
