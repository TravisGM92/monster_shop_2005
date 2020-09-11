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

          describe 'When I click on the link to edit my profile' do
            describe "I see a form like the registration page" do
              describe "The form is prepoputaed with all my current info except password" do
                describe "When I change any or all of that info" do
                  describe "And I submit the form" do
                    describe "Then I am returned to my profile page" do
                      describe "and I see a flash message telling me that my data is upated" do
                        it "And I see my updated info" do
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

                          expect(find_field('Name').value).to eq("Ross Mooney")
                          expect(find_field('Address').value).to eq("2468 S. Grant St.")
                          expect(find_field('City').value).to eq("Littleton")
                          expect(find_field('State').value).to eq("CO")
                          expect(find_field('Zip').value).to eq("80121")
                          expect(find_field('Email').value).to eq("ross_is_cool@turing.io")

                          fill_in :name, with: "Billy"
                          fill_in :address, with: "homeless"
                          fill_in :city, with: "Aurora"

                          click_button("Update profile")
                          expect(current_path).to eq("/profile")

                          expect(page).to have_content("Profile updated")
                          expect(page).to have_content("Billy\n")
                          expect(page).to have_content("Address: homeless\n")
                          expect(page).to_not have_content("Ross")



                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end

      end
    end
  end
