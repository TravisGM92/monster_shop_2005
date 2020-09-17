# require 'rails_helper'
#
# RSpec.describe 'merchant show page', type: :feature do
#
#   describe 'As a merchant employee' do
#     before :each do
#       @merchant_employee = User.create!(name: "Dwight Kurt Schrute III", address: "123 Beet Farm", city: "Scranton", state: "PA", zip: 18510, email: "d-money@email.com", password: "angela", role: 1)
#       @meg = Merchant.create!(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
#     end
#
#     describe "When I visit my merchant dashboard('/merchant')" do
#       it "I see the name and full address of the merchant I work for" do
#
#         allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant_employee)
#
#         visit '/merchant'
#
#         expect(page).to have_content("\nMeg's Bike Shop\n123 Bike Rd.\nDenver, CO, 80203")
#       end
#     end
#
#   end
# end
