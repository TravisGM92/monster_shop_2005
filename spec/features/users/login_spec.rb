require "rails_helper"

RSpec.describe "Login Page" do

  before(:each) do
    @user = User.create!(name: "Elah Pillado", address: "123 Chase Rd", city: "Marietta", state: "GA", zip: 30008, email: "elah@email.com", password: "password", role: 0)
    @merchant = User.create!(name: "Sinai Pillado", address: "123 Chase Rd", city: "Marietta", state: "GA", zip: 30008, email: "sinai@email.com", password: "password", role: 1)
    @admin = User.create!(name: "Nelcy Pillado", address: "123 Kedvale Ave", city: "Chicago", state: "IL", zip: 60623, email: "nelcy@email.com", password: "password", role: 2)
  end

  it "If I am a regular user, I am redirected to my profile page. A flash message will confirm I am logged in." do

    visit "/login"

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_button "Log In"

    expect(current_path).to eq("/profile")
    expect(page).to have_content("You are now logged in!")
  end

  it "If I am a merchant employee, I am redirected to my merchant dashboard. A flash message will confirm I am logged in." do

    visit "/login"

    fill_in :email, with: @merchant.email
    fill_in :password, with: @merchant.password

    click_button "Log In"

    expect(current_path).to eq("/merchant")
    expect(page).to have_content("You are now logged in!")
  end

  it "If I am an admin user, I am redirected to my admin dashboard. A flash message will confirm I am logged in." do

    visit "/login"

    fill_in :email, with: @admin.email
    fill_in :password, with: @admin.password

    click_button "Log In"

    expect(current_path).to eq("/admin")
    expect(page).to have_content("You are now logged in!")
  end

  it "User cannot log in with bad credentials." do

    visit "/login"

    password = "Cool123"
    fill_in :email, with: @user.email
    fill_in :password, with: password

    click_button "Log In"

    expect(current_path).to eq("/login")
    expect(page).to have_content("Uh oh... Wrong email or password. Please try again!")
  end

  it "Regular users who are logged in already are redirected to profile page." do

    visit "/login"

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button "Log In"
    expect(current_path).to eq("/profile")

    visit "/login"
    expect(current_path).to eq("/profile")
    expect(page).to have_content("You're already logged in!")
    # expect(page).to_not have_link("Log In")
    # expect(page).to_not have_link("Register")
  end

  it "Merchant employees who are logged in already are redirected to their merchant dashboard." do

    visit "/login"

    fill_in :email, with: @merchant.email
    fill_in :password, with: @merchant.password
    click_button "Log In"
    expect(current_path).to eq("/merchant")

    visit "/login"
    expect(current_path).to eq("/merchant")
    expect(page).to have_content("You're already logged in!")
    # expect(page).to_not have_link("Log In")
    # expect(page).to_not have_link("Register")
  end

  it "Admin users who are logged in already are redirected to their admin dashboard." do

    visit "/login"

    fill_in :email, with: @admin.email
    fill_in :password, with: @admin.password
    click_button "Log In"
    expect(current_path).to eq("/admin")

    visit "/login"
    expect(current_path).to eq("/admin")
    expect(page).to have_content("You're already logged in!")
    # expect(page).to_not have_link("Log In")

    # expect(page).to_not have_link("Register")
  end

end
