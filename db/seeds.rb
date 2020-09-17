# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Merchant.destroy_all
Item.destroy_all

#merchants
bike_shop = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
dog_shop = Merchant.create(name: "Brian's Dog Shop", address: '125 Doggo St.', city: 'Denver', state: 'CO', zip: 80210)

#bike_shop items
tire = bike_shop.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12, quantity_purchased: 4)
bike = bike_shop.items.create(name: "Street Bike", description: "Brand new", price: 200, image: "https://www.bikeride.com/images/bike/Orro-FE-Wiggle-Profile-Scaled.jpg", inventory: 2, quantity_purchased: 1)

#dog_shop items
pull_toy = dog_shop.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", inventory: 32, quantity_purchased: 20)
dog_bone = dog_shop.items.create(name: "Dog Bone", description: "They'll love it!", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", active?:false, inventory: 21, quantity_purchased: 12)

# @susan = User.create!(name: 'Susan Sarandon',
#     address: '1235 Beverly Hills Blvd',
#     city: 'Hollywood',
#     state: 'CA',
#     zip: '90210',
#     email: 'actress@movies.com',
#     password: 'password',
#     role: 2)

#     @mike = Merchant.create(name: "Mike's Print Shop", address: '123 Paper Rd.', city: 'Denver', state: 'CO', zip: 80203)
#     @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
#     @tire = @meg.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
#     @paper = @mike.items.create(name: "Lined Paper", description: "Great for writing on!", price: 20, image: "https://cdn.vertex42.com/WordTemplates/images/printable-lined-paper-wide-ruled.png", inventory: 3)
#     @pencil = @mike.items.create(name: "Yellow Pencil", description: "You can write on paper with it!", price: 2, image: "https://images-na.ssl-images-amazon.com/images/I/31BlVr01izL._SX425_.jpg", inventory: 100)

#     @ross = User.create!(name: 'Ross Mooney',
#     address: '2468 S. Grant St.',
#     city: 'Littleton',
#     state: 'CO',
#     zip: '80121',
#     email: 'ross_is_cool@turing.io',
#     password: 'test124',
#     role: 0)

#     @dwight = User.create!(name: 'Dwight Shrute',
#     address: '5423 Main St.',
#     city: 'Scranton',
#     state: 'PA',
#     zip: '52341',
#     email: 'assistant_to_the_Manager@dundermifflin.com',
#     password: 'ihatejim',
#     role: 0)

#     @order_1 = @ross.orders.create(name: "Bert", address: "123 Sesame St.", city: "NYC", state: "New York", zip: 10001, status: 1)
#     @io1 = @paper.item_orders.create(order_id: @order_1.id, quantity: 4, price: 20)
#     @io2 = @tire.item_orders.create(order_id: @order_1.id, quantity: 2, price: 100)

#     @order_2 = @ross.orders.create(name: "Ernie", address: "2343 Sesame St.", city: "NYC", state: "NY", zip: 55555, status: 0)
#     @io3 = @paper.item_orders.create(order_id: @order_2.id, quantity: 5, price: 20)
#     @io4 = @tire.item_orders.create(order_id: @order_2.id, quantity: 3, price: 100)
#     @io5 = @pencil.item_orders.create(order_id: @order_2.id, quantity: 1, price: 2)

#     @order_3 = @dwight.orders.create(name: "Michael", address: "2341 BestBoss Ave.", city: "Scranton", state: "PA", zip: 41241, status: 3)
#     @io5 = @paper.item_orders.create(order_id: @order_3.id, quantity: 1000, price: 2)
    
#     @order_4 = @dwight.orders.create(name: "Jim", address: "6235 Kazoo St.", city: "Pittburgh", state: "PA", zip: 41241, status: 2)
#     @io5 = @paper.item_orders.create(order_id: @order_3.id, quantity: 1000, price: 2)
