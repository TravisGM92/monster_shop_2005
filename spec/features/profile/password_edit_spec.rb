require 'rails_helper'

RSpec.describe 'Edit profile password' do
  describe 'As a registered user, when I visit my profile page' do
    describe 'I see a link to edit my password' do
      describe "When I click on the link to edit my password I see a form with fields for a new password and confirmation" do
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

          describe 'When I fill in the same password in both fields' do
            describe "And I submit the form I am returned to my profile page" do
              it "and I see a flash message telling me that my password is updated and I see my updated info" do
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

                expect(page).to have_link("Edit password")
                expect(current_path).to eq("/profile/edit_password")

                expect(page).to have_content("New password:")
                expect(page).to have_content("Confirm new password:")

                fill_in "New password", with: "123h"
                fill_in "Confirm new password", with: "123h"
                click_button "Update password"

                expect(current_path).to eq("/profile")
                expect(page).to have_content("Your password has been updated")
              end
            end
          end
        end

      end
    end
  end
