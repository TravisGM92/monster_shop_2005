require 'rails_helper'

RSpec.describe 'Profile show' do
  describe 'As a registered user, when I visit my profile page' do
    describe 'Then I see all of my profile data on the page except my password' do
      describe "And I see a link to edit my profile data" do
        before(:each) do
          ross = User.create(name: 'Ross Mooney',
            address: '2468 S. Grant St.',
            city: 'Littleton',
            state: 'CO',
            zip: '80121',
            email: 'ross_is_cool@turing.io',
            password: 'test124',
            role: 0)
            
          end

          it 'I see all items Ive added to my cart' do
            visit '/cart'

          end
        end

      end
    end
  end
