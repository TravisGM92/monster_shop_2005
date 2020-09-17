# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ItemOrder.destroy_all
Item.destroy_all
Merchant.destroy_all
Order.destroy_all
User.destroy_all

#merchants

# @mike = Merchant.create(name: "Mike's Print Shop", address: '123 Paper Rd.', city: 'Denver', state: 'CO', zip: 80203)
# @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
# @tire = @meg.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
# @paper = @mike.items.create(name: "Lined Paper", description: "Great for writing on!", price: 20, image: "https://cdn.vertex42.com/WordTemplates/images/printable-lined-paper-wide-ruled.png", inventory: 3)
# @pencil = @mike.items.create(name: "Yellow Pencil", description: "You can write on paper with it!", price: 2, image: "https://images-na.ssl-images-amazon.com/images/I/31BlVr01izL._SX425_.jpg", inventory: 100)
# @backpack = @mike.items.create(name: "Yellow Pencil", description: "You can write on paper with it!", price: 2, image: "https://images-na.ssl-images-amazon.com/images/I/31BlVr01izL._SX425_.jpg", inventory: 100)
# @rock = @mike.items.create(name: "Yellow Pencil", description: "You can write on paper with it!", price: 2, image: "https://images-na.ssl-images-amazon.com/images/I/31BlVr01izL._SX425_.jpg", inventory: 100)
#
#
# @ross = User.create!(name: 'Ross Mooney',
# address: '2468 S. Grant St.',
# city: 'Littleton',
# state: 'CO',
# zip: '80121',
# email: 'ross_is_cool25@turing.io',
# password: 'test124',
# role: 0)
#
# # ItemOrder.group(:item_id).sum(:quantity).sort_by{ |item_id, quantity| -quantity}
# order_1 = @ross.orders.create(name: "Bert", address: "123 Sesame St.", city: "NYC", state: "New York", zip: 10001)
# order_2 = @ross.orders.create(name: "Bert", address: "123 Sesame St.", city: "NYC", state: "New York", zip: 10001)
#
#
# io1 = @paper.item_orders.create(order_id: order_1.id, quantity: 4, price: 20)
# io2 = @tire.item_orders.create(order_id: order_1.id, quantity: 3, price: 100)
# io3 = @pencil.item_orders.create(order_id: order_2.id, quantity: 5, price: 10)
# io4 = @backpack.item_orders.create(order_id: order_2.id, quantity: 2, price: 10)
# io5 = @rock.item_orders.create(order_id: order_2.id, quantity: 1, price: 10)
# io6 = @pencil.item_orders.create(order_id: order_2.id, quantity: 5, price: 10)

