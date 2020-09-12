require 'rails_helper'

RSpec.describe 'Edit profile password' do
  describe 'As a registered user, when I attempt to edit my profile data' do
    describe 'if I try to chagne my email address that belongs to another user' do
      describe "When I submit the form" do
        before(:each) do
          @ross = User.create!(name: 'Ross Mooney',
            address: '2468 S. Grant St.',
            city: 'Littleton',
            state: 'CO',
            zip: '80121',
            email: 'ross_is_cool@turing.io',
            password: 'test124',
            role: 0)

            @george = User.create!(name: "George Clooney", address: "223 South Road", city: "Aurora", state: "UT", zip: "87761", email: "hello@msn.com", password: "nope", role: 0)

          end

          describe 'Then I am returned to the profile edit page' do
            it "And I see a flash message telling me that email addresss is already in use" do
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

              click_link("Edit profile")
              expect(current_path).to eq("/profile/edit")

              expect(find_field('Name').value).to eq("George Clooney")
              expect(find_field('Address').value).to eq("223 South Road")
              expect(find_field('City').value).to eq("Aurora")
              expect(find_field('State').value).to eq("UT")
              expect(find_field('Zip').value).to eq("87761")
              expect(find_field('Email').value).to eq("hello@msn.com")

              fill_in "Email", with: "ross_is_cool@turing.io"
              click_button "Update profile"

              expect(current_path).to eq("/profile/edit")
              expect(page).to have_content("This email is already in use.")
            end
          end
        end

      end
    end
  end
