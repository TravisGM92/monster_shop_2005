require 'rails_helper'

RSpec.describe("Profile order show page") do
    describe "When I visit the 'My Orders' link" do
        describe "I can click on an order number" do
            it "Will show all the details of that order" do

                @mike = Merchant.create(name: "Mike's Print Shop", address: '123 Paper Rd.', city: 'Denver', state: 'CO', zip: 80203)
                @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
                @tire = @meg.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
                @paper = @mike.items.create(name: "Lined Paper", description: "Great for writing on!", price: 20, image: "https://cdn.vertex42.com/WordTemplates/images/printable-lined-paper-wide-ruled.png", inventory: 3)
                @pencil = @mike.items.create(name: "Yellow Pencil", description: "You can write on paper with it!", price: 2, image: "https://images-na.ssl-images-amazon.com/images/I/31BlVr01izL._SX425_.jpg", inventory: 100)

                @ross = User.create!(name: 'Ross Mooney',
                address: '2468 S. Grant St.',
                city: 'Littleton',
                state: 'CO',
                zip: '80121',
                email: 'ross_is_cool@turing.io',
                password: 'test124',
                role: 0)
                allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@ross)

                @order_1 = @ross.orders.create(name: "Bert", address: "123 Sesame St.", city: "NYC", state: "New York", zip: 10001)

                @order_2 = @ross.orders.create(name: "Ernie", address: "2343 Sesame St.", city: "NYC", state: "NY", zip: 55555)

                io1 = @paper.item_orders.create(order_id: @order_1.id, quantity: 4, price: 20)
                io2 = @tire.item_orders.create(order_id: @order_1.id, quantity: 2, price: 100)
                io3 = @paper.item_orders.create(order_id: @order_2.id, quantity: 5, price: 20)
                io4 = @tire.item_orders.create(order_id: @order_2.id, quantity: 3, price: 100)
                io5 = @pencil.item_orders.create(order_id: @order_2.id, quantity: 1, price: 2)

                visit "/profile/orders"

                within "#order-#{@order_1.id}" do
                    click_link "#{@order_1.id}"
                end

                expect(current_path).to eq("/profile/orders/#{@order_1.id}")

                expect(page).to have_content("#{@order_1.id}")
                expect(page).to have_content("#{@order_1.created_at}")
                expect(page).to have_content("#{@order_1.updated_at}")
                expect(page).to have_content("#{@order_1.status}")

                expect(page).to have_link(@paper.merchant.name)
                expect(page).to have_link(@paper.name)
                expect(page).to have_content(@paper.description)
                expect(page).to have_content("$#{@paper.price}")
                expect(page).to have_link(@paper.merchant.name)
                expect(page).to have_css("img[src*='#{@paper.image}']")

                expect(page).to have_link(@tire.merchant.name)
                expect(page).to have_link(@tire.name)
                expect(page).to have_content(@tire.description)
                expect(page).to have_content("$#{@tire.price}")
                expect(page).to have_link(@tire.merchant.name)
                expect(page).to have_css("img[src*='#{@tire.image}']")

                expect(page).to have_content("#{@order_1.total_quantity}")
                expect(page).to have_content("#{@order_1.grandtotal}")

            end

            it "shows a link to cancel the order" do

                @mike = Merchant.create(name: "Mike's Print Shop", address: '123 Paper Rd.', city: 'Denver', state: 'CO', zip: 80203)
                @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
                @tire = @meg.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
                @paper = @mike.items.create(name: "Lined Paper", description: "Great for writing on!", price: 20, image: "https://cdn.vertex42.com/WordTemplates/images/printable-lined-paper-wide-ruled.png", inventory: 3)
                @pencil = @mike.items.create(name: "Yellow Pencil", description: "You can write on paper with it!", price: 2, image: "https://images-na.ssl-images-amazon.com/images/I/31BlVr01izL._SX425_.jpg", inventory: 100)

                @ross = User.create!(name: 'Ross Mooney',
                address: '2468 S. Grant St.',
                city: 'Littleton',
                state: 'CO',
                zip: '80121',
                email: 'ross_is_cool@turing.io',
                password: 'test124',
                role: 0)
                allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@ross)

                @order_1 = @ross.orders.create(name: "Bert", address: "123 Sesame St.", city: "NYC", state: "New York", zip: 10001)

                @order_2 = @ross.orders.create(name: "Ernie", address: "2343 Sesame St.", city: "NYC", state: "NY", zip: 55555)

                io1 = @paper.item_orders.create(order_id: @order_1.id, quantity: 4, price: 20)
                io2 = @tire.item_orders.create(order_id: @order_1.id, quantity: 2, price: 100)
                io3 = @paper.item_orders.create(order_id: @order_2.id, quantity: 5, price: 20)
                io4 = @tire.item_orders.create(order_id: @order_2.id, quantity: 3, price: 100)
                io5 = @pencil.item_orders.create(order_id: @order_2.id, quantity: 1, price: 2)

                visit "/profile/orders"

                within "#order-#{@order_1.id}" do
                  click_link "#{@order_1.id}"
                end

                expect(page).to have_link("Cancel Order")

                click_link "Cancel Order"

                expect(current_path).to eq("/profile")
                expect(page).to have_content("Your order has been cancelled")
                expect(@order_1.status).to eq("cancelled")
                
              end
        end
    end
end
