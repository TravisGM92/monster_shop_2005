class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :item_orders, through: :items

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip


  def no_orders?
    item_orders.empty?
  end

  def item_count
    items.count
  end

  def average_item_price
    items.average(:price)
  end

  def distinct_cities
    item_orders.distinct.joins(:order).pluck(:city)
  end

  def merchant_orders
    if Order.all == []
      return nil
    else
      numbs = Order.first.items.pluck(:id)
      merchant_name = Merchant.joins(:items).where(items: {id: numbs})
      if self.name == merchant_name[0].name
        return Order.first
      end
    end
  end

end
