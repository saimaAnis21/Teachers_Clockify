require 'rails_helper'

RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

RSpec.describe 'User', type: :model do
  it 'is valid with a name' do
    user = User.create(name: 'Janet')
    expect(user).to be_valid
  end

  it 'is not valid without name' do
    user = User.create()
    expect(user).to_not be_valid
  end

  it 'is not valid if name is less than 5 characters' do
    user = User.create(name: 'Jane')
    expect(user).to_not be_valid
  end

end

describe 'associations' do
  it 'should have many groups' do
    t = User.reflect_on_association(:groups)
    expect(t.macro).to eq(:has_many)
  end

  it 'should have many time_spents' do
    t = User.reflect_on_association(:time_spents)
    expect(t.macro).to eq(:has_many)
  end
end
