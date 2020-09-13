require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end
  describe "relationships" do
    it { should have_many :orders }
  end
end

describe "roles" do
  it 'can be created as a default user' do
    user = User.create(name: 'Saryn Mooney', address: '1234 Cherry St', city: 'Denver', state: 'CO', zip: '80209', email: 'saryn@turing.io', password: 'test123', role: 0)

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
