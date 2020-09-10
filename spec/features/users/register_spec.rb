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


      expect(page).to have_content("Address can't be blank and Email can't be blank")
      expect(page).to have_button("Register New User")
    end

    it 'I cant create a user if there is a duplicate email' do
      user_1 = User.create({name: "Tim Tyrell", address: "142 Road Street", city: "Denver", state: "CO", zip: 54235, email: "hackerman88@hotmail.com", password: "1234abcd"})
      
      visit '/register'

      name = "Mike Dao"
      address = '123 Chicken Nugget Dr.'
      city = "Denver"
      state = "CO"
      zip = 80204
      email = "hackerman88@hotmail.com"
      password = "password"
      password_confirm = "password"

      fill_in "Name", with: name
      fill_in "Address", with: address
      fill_in "City", with: city
      fill_in "State", with: state
      fill_in "Zip", with: zip
      fill_in "Email", with: email
      fill_in "Password", with: password
      fill_in "Password confirmation", with: password_confirm

      click_button "Register New User"

      expect(current_path).to eq('/register')

      expect(page).to have_content("Email has already been taken")
      expect(page).to have_xpath("//input[@value='Mike Dao']")
      expect(page).to have_xpath("//input[@value='123 Chicken Nugget Dr.']")
      expect(page).to have_xpath("//input[@value='Denver']")
      expect(page).to have_xpath("//input[@value='CO']")
      expect(page).to have_xpath("//input[@value=80204]")
      expect(page).to_not have_xpath("//input[@value='hackerman88@hotmail.com']")
      expect(page).to_not have_xpath("//input[@value='password']")
    end
  end
end 