require 'rails_helper'

RSpec.describe 'User registration page', type: :feature do
  describe 'As a visitor' do
    it 'I can register a new user' do
      visit '/register'

      name = "Mike Dao"
      address = '123 Chicken Nugget Dr.'
      city = "Denver"
      state = "CO"
      zip = 80204
      email = "hackerman88@hotmail.com"
      password = "password"
      password_confirm = "password"

      fill_in :name, with: name
      fill_in :address, with: address
      fill_in :city, with: city
      fill_in :state, with: state
      fill_in :zip, with: zip
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirm
      click_button "Register New User"
      expect(current_path).to eq('/profile')
      expect(page).to have_content("Welcome #{name}!")
      
    end

    it 'I cant create a user if all fields are not filled in' do
        visit '/register'

        name = "Mike Dao"
        address = ""
        city = "Denver"
        state = "CO"
        zip = 80204
        email = ""
        password = "password"
        password_confirm = "password"
  
        fill_in :name, with: name
        fill_in :address, with: address
        fill_in :city, with: city
        fill_in :state, with: state
        fill_in :zip, with: zip
        fill_in :email, with: email
        fill_in :password, with: password
        fill_in :password_confirmation, with: password_confirm
  
        click_button "Register New User"

        expect(current_path).to eq('/register')


      expect(page).to have_content("Address field required")
      expect(page).to have_content("Email field required")
      expect(page).to have_button("Register New User")
    end

  end
end
