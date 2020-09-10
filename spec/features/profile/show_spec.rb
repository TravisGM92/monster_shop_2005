require 'rails_helper'

RSpec.describe 'Profile show' do
  describe 'As a registered user, when I visit my profile page' do
    describe 'Then I see all of my profile data on the page except my password' do
      describe "And I see a link to edit my profile data" do
        before(:each) do
          @ross = User.create!(name: 'Ross Mooney',
            address: '2468 S. Grant St.',
            city: 'Littleton',
            state: 'CO',
            zip: '80121',
            email: 'ross_is_cool@turing.io',
            password: 'test124',
            role: 0)

          end

          it 'I see all of my information' do
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@ross)

            visit "/profile"

            expect(page).to have_content("#{@ross.name}")
            expect(page).to have_content("#{@ross.address}")
            expect(page).to have_content("#{@ross.city}")
            expect(page).to have_content("#{@ross.state}")
            expect(page).to have_content("#{@ross.zip}")
            expect(page).to have_content("#{@ross.email}")
            expect(page).to have_content("Role: default")
            expect(page).to_not have_content("#{@ross.password}")

            expect(page).to have_link("Edit profile")

          end
        end

      end
    end
  end
