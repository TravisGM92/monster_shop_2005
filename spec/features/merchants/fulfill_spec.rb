require 'rails_helper'

RSpec.describe 'merchant show page', type: :feature do
  describe 'As a merchant employee' do
    before :each do
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



    end

    describe "When all items in an order have been fulfilled by their merchants" do
      it "The order status changes from 'pending' to 'packaged' (one item on one order)" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@mike)
        order_1 = @ross.orders.create(name: "Bert", address: "123 Sesame St.", city: "NYC", state: "New York", zip: 10001)


        io1 = @paper.item_orders.create!(order_id: order_1.id, quantity: 4, price: 20)
        visit "/merchant"

        expect(page).to have_content("Order for:")
        expect(page).to have_content("Order for:\nLined Paper")
        expect(page).to have_button("Fulfill")
        click_button("Fulfill")
        expect(current_path).to eq("/merchant")
        expect(@ross.orders[0].status).to eq("packaged")
      end
    end


  end
end
