require "rails_helper"

RSpec.describe "User can login" do

  before(:each) do
    @user = User.create!(name: "Elah Pillado", address: "123 Chase Rd", city: "Marietta", state: "GA", zip: 30008, email: "elah@email.com", password: "password", role: 0)
    @merchant = User.create!(name: "Sinai Pillado", address: "123 Chase Rd", city: "Marietta", state: "GA", zip: 30008, email: "sinai@email.com", password: "password", role: 1)
    @admin = User.create!(name: "Nelcy Pillado", address: "123 Kedvale Ave", city: "Chicago", state: "IL", zip: 60623, email: "nelcy@email.com", password: "password", role: 2)
  end

  it "If I am a regular user, I am redirected to my profile page. A flash message will confirm I am logged in" do

    visit "/login"

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_button "Log In"

    expect(current_path).to eq("/profile")
    expect(page).to have_content("You are now logged in!")
  end

end

# User Story 13, User can Login
#
# As a visitor
# When I visit the login path
# I see a field to enter my email address and password
# When I submit valid information
# If I am a regular user, I am redirected to my profile page
# If I am a merchant user, I am redirected to my merchant dashboard page
# If I am an admin user, I am redirected to my admin dashboard page
# And I see a flash message that I am logged in
