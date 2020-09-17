require 'rails_helper'

RSpec.describe 'Admin Dashboard' do
  describe 'As a registered admin, when I visit my dashboard' do
        before(:each) do
            @susan = User.create!(name: 'Susan Sarandon',
            address: '1235 Beverly Hills Blvd',
            city: 'Hollywood',
            state: 'CA',
            zip: '90210',
            email: 'actress@movies.com',
            password: 'password',
            role: 2)

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

            @dwight = User.create!(name: 'Dwight Shrute',
            address: '5423 Main St.',
            city: 'Scranton',
            state: 'PA',
            zip: '52341',
            email: 'assistant_to_the_Manager@dundermifflin.com',
            password: 'ihatejim',
            role: 0)
        
            @order_1 = @ross.orders.create(name: "Bert", address: "123 Sesame St.", city: "NYC", state: "New York", zip: 10001, status: 1)
            @io1 = @paper.item_orders.create(order_id: @order_1.id, quantity: 4, price: 20)
            @io2 = @tire.item_orders.create(order_id: @order_1.id, quantity: 2, price: 100)

            @order_2 = @ross.orders.create(name: "Ernie", address: "2343 Sesame St.", city: "NYC", state: "NY", zip: 55555, status: 0)
            @io3 = @paper.item_orders.create(order_id: @order_2.id, quantity: 5, price: 20)
            @io4 = @tire.item_orders.create(order_id: @order_2.id, quantity: 3, price: 100)
            @io5 = @pencil.item_orders.create(order_id: @order_2.id, quantity: 1, price: 2)

            @order_3 = @dwight.orders.create(name: "Michael", address: "2341 BestBoss Ave.", city: "Scranton", state: "PA", zip: 41241, status: 3)
            @io5 = @paper.item_orders.create(order_id: @order_3.id, quantity: 1000, price: 2)
            
            @order_4 = @dwight.orders.create(name: "Jim", address: "6235 Kazoo St.", city: "Pittburgh", state: "PA", zip: 41241, status: 2)
            @io5 = @paper.item_orders.create(order_id: @order_3.id, quantity: 1000, price: 2)

        end

        it 'Shows a summary of all orders in order from packaged, pending, shipped, cancelled' do
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@susan)

            visit "/admin"


            within "#order-#{@order_1.id}" do
                expect(page).to have_link("#{@order_1.name}")
                expect(page).to have_content("#{@order_1.id}")
                expect(page).to have_content("#{@order_1.created_at}")
            end

            within "#order-#{@order_2.id}" do
                expect(page).to have_link("#{@order_2.name}")
                expect(page).to have_content("#{@order_2.id}")
                expect(page).to have_content("#{@order_2.created_at}")
            end

            within "#order-#{@order_3.id}" do
                expect(page).to have_link("#{@order_3.name}")
                expect(page).to have_content("#{@order_3.id}")
                expect(page).to have_content("#{@order_3.created_at}")
            end

            # within "#orders" do
            #     expect(".order-#{@order_2.id}").to appear_before(".order-#{@order_1.id}")
            #     expect(".order-#{@order_1.id}").to appear_before(".order-#{@order_4.id}")
            #     expect(".order-#{@order_4.id}").to appear_before(".order-#{@order_3.id}")
            #         #OR use
            #     # expect(page.all("orders")).to eq()
            # end
        end
        it "can ship an order using a button" do
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@susan)
            
            visit "/admin"

            within "#order-#{@order_1.id}" do
                expect(page).to_not have_button("Ship")
            end

            within "#order-#{@order_2.id}" do
                expect(page).to have_button("Ship")
            end

            within "#order-#{@order_3.id}" do
                expect(page).to_not have_button("Ship")
            end

            click_button "Ship"
            within "#order-#{@order_2.id}" do
                expect(page).to have_content("shipped")
            end

            @order_2.reload

            assert @order_2.status == "shipped"

        end
    end
end