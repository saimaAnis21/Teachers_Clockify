require 'rails_helper'

RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

RSpec.describe 'TimeSpent', type: :model do
  it 'is valid with a name, amount and authorid' do
    user = User.create(name: 'Janet')
    ts = TimeSpent.create(name: 'English', Amount: 60, author_id: user.id)
    expect(ts).to be_valid
  end

  it 'is not valid without name' do
    user = User.create(name: 'Janet')
    ts = TimeSpent.create(Amount: 60, author_id: user.id)
    expect(ts).to_not be_valid
  end

  it 'is not valid if name is less than 5 characters' do
    user = User.create(name: 'Janet')
    ts = TimeSpent.create(name: 'Eng', Amount: 60, author_id: user.id)
    expect(ts).to_not be_valid
  end

  it 'is not valid if amount is not present' do
    user = User.create(name: 'Janet')
    ts = TimeSpent.create(name: 'English', author_id: user.id)
    expect(ts).to_not be_valid
  end

  it 'is not valid if amount is not integer' do
    user = User.create(name: 'Janet')
    ts = TimeSpent.create(name: 'English', Amount: 'sixty', author_id: user.id)
    expect(ts).to_not be_valid
  end

  it 'is not valid if amount is not greater than 60' do
    user = User.create(name: 'Janet')
    ts = TimeSpent.create(name: 'English', Amount: 59, author_id: user.id)
    expect(ts).to_not be_valid
  end

  it 'is not valid if authorid is not present' do
    ts = TimeSpent.create(name: 'English', Amount: 60)
    expect(ts).to_not be_valid
  end
end

describe 'associations' do
  it 'should have many group_times' do
    t = TimeSpent.reflect_on_association(:group_times)
    expect(t.macro).to eq(:has_many)
  end

  it 'should have many groups' do
    t = TimeSpent.reflect_on_association(:groups)
    expect(t.macro).to eq(:has_many)
  end
end
