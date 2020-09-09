require 'rails_helper'

describe 'As a merchant employee' do
  it 'displays nav bar with same links as a regular user including a link to merchant dashboard' do
    merchant = User.create(name: 'Ross Mooney',
                          address: '2468 S. Grant St.',
                          city: 'Littleton',
                          state: 'CO',
                          zip: '80121',
                          email: 'ross_is_cool@turing.io',
                          password: 'test124',
                          role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(merchant)

    visit '/merchants'

    within 'nav' do
      click_link 'Merchant Dashboard'
    end

    expect(current_path).to eq('/merchant')
  end
end

describe 'As an admin' do
  it 'displays nav bar with same links as a regular user including admin specific links ' do
    admin = User.create(name: 'Napoleon Dynamite',
                        address: '33 Shorty Ave',
                        city: 'Los Angeles',
                        state: 'CA',
                        zip: '12345',
                        email: 'actors_rule@turing.io',
                        password: 'test125',
                        role: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin'

    within 'nav' do
      click_link 'Admin Dashboard'
    end

    expect(current_path).to eq('/admin')

    within 'nav' do
      click_link 'All Users'
    end

    expect(current_path).to eq('/admin/users')

    within 'nav' do
      expect(page).to_not have_content('Cart: 0')
    end

  end
end
