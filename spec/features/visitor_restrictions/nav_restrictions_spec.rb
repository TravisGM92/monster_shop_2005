
require 'rails_helper'

RSpec.describe 'Site Navigation Restrictions' do
  describe 'As a Visitor' do
    describe "When I try to access any path that begins with the following" do
      it "I see a 404 error (/merchant, /admin, or /profile)" do

        visit '/merchants'

        # expect(page).to eq("The page you were looking for doesn't exist.")

        # visit '/admin'

        # expect(page).to eq("The page you were looking for doesn't exist.")

        # visit '/profile'

        # expect(page).to eq("The page you were looking for doesn't exist.")
      end
    end
  end

  describe 'As a default user' do
    describe "When I try to access any path that begins with the following" do
      it "I see a 404 error (/merchant, /admin)" do

        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/merchants'

        # expect(page).to eq("The page you were looking for doesn't exist.")

        # visit '/admin'

        # expect(page).to eq("The page you were looking for doesn't exist.")
      end
    end
  end

  describe 'As a merchant employee' do
    describe "When I try to access any path that begins with the following" do
      it "I see a 404 error (/admin)" do

        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(merchant)

        # visit '/admin'

        # expect(page).to eq("The page you were looking for doesn't exist.")
      end
    end
  end

  describe 'As an admin' do
    describe "When I try to access any path that begins with the following" do
      it "I see a 404 error (/merchant, /cart)" do

        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit '/cart'

        # expect(page).to eq("The page you were looking for doesn't exist.")

        visit '/merchants'

        # expect(page).to eq("The page you were looking for doesn't exist.")
      end
    end
  end
end
