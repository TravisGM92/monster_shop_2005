RSpec.describe("User checkout order") do
  describe "When I place an order" do
    before(:each) do
      @mike = Merchant.create!(name: "Mike's Print Shop", address: '123 Paper Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @meg = Merchant.create!(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
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


      visit "/items/#{@paper.id}"
      click_on "Add To Cart"
      visit "/items/#{@paper.id}"
      click_on "Add To Cart"
      visit "/items/#{@tire.id}"
      click_on "Add To Cart"
      visit "/items/#{@pencil.id}"
      click_on "Add To Cart"
    end
    describe "I see a button or link indicating 'check out'" do
      describe "I click the button and fill out order info and click 'create order'" do
        describe "An order is created in the system which has a status of 'pending'" do
          describe "That order is associated with my user and I am taken to my orders page ('/profile/orders')" do
            describe "I see a flash message telling me my order was created" do
              it "I see my new order on my profile orders page, my cart is now empty" do

                visit "/cart"

                click_on "Checkout"

                within "#order-item-#{@tire.id}" do
                  expect(page).to have_link(@tire.name)
                  expect(page).to have_link("#{@tire.merchant.name}")
                  expect(page).to have_content("$#{@tire.price}")
                  expect(page).to have_content("1")
                  expect(page).to have_content("$100")
                end

                within "#order-item-#{@paper.id}" do
                  expect(page).to have_link(@paper.name)
                  expect(page).to have_link("#{@paper.merchant.name}")
                  expect(page).to have_content("$#{@paper.price}")
                  expect(page).to have_content("2")
                  expect(page).to have_content("$40")
                end

                within "#order-item-#{@pencil.id}" do
                  expect(page).to have_link(@pencil.name)
                  expect(page).to have_link("#{@pencil.merchant.name}")
                  expect(page).to have_content("$#{@pencil.price}")
                  expect(page).to have_content("1")
                  expect(page).to have_content("$2")
                end

                expect(page).to have_content("Total: $142")

                visit "/cart"
                click_on "Checkout"

                fill_in :name, with: "Billy"
                fill_in :address, with: "homeless"
                fill_in :city, with: "Aurora"
                fill_in :state, with: "CO"
                fill_in :zip, with: "80226"
                click_button("Create Order")
                expect(current_path).to eq("/profile/orders")
                expect(page).to have_content("Your order has been submitted")
              end
            end
          end
        end
      end
    end
  end
end
