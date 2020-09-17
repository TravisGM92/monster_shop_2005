require "rails_helper"

RSpec.describe "Logout" do

  before(:each) do
    @bike_shop = Merchant.create(name: "Brian's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
    @chain = @bike_shop.items.create(name: "Chain", description: "It'll never break!", price: 50, image: "https://www.rei.com/media/b61d1379-ec0e-4760-9247-57ef971af0ad?size=784x588", inventory: 5)
    @user = User.create!(name: "Dwight Kurt Schrute III", address: "123 Beet Farm", city: "Scranton", state: "PA", zip: 18510, email: "d-money@email.com", password: "angela", role: 0)
  end

  it "As a registered user, merchant, or admin, when I click on 'Log Out', I am redirected to the welcome page." do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit "/items/#{@chain.id}"
    click_on "Add To Cart"

    expect(page).to have_content("Cart: 1")

    within("nav") do
      click_on "Log Out"
    end

    expect(current_path).to eq('/')
    expect(page).to have_content("You have logged out. See you next time!")
    expect(page).to have_content("Cart: 0")
  end

end
