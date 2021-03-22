require 'rails_helper'

RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

RSpec.describe 'Group', type: :model do
  it 'is valid with a name' do
    user = User.create(name: 'Janet')
    grp = Group.create(name: 'Grade-1', Icon: 'http://xtz.com', user_id: user.id)
    expect(grp).to be_valid
  end

  it 'is valid without icon' do
    user = User.create(name: 'Janice')
    grp = Group.create(name: 'Grade-2', user_id: user.id)
    expect(grp).to be_valid
  end

  it 'is not valid without name' do
    user = User.create(name: 'Janet')
    grp = Group.create(Icon: 'http://xtz.com', user_id: user.id)
    expect(grp).to_not be_valid
  end

  it 'is not valid if name is less than 5 characters' do
    user = User.create(name: 'Janet')
    grp = Group.create(name: 'Grad', Icon: 'http://xtz.com', user_id: user.id)
    expect(grp).to_not be_valid
  end

  it 'is not valid if userid not present' do
    grp = Group.create(name: 'Grad', Icon: 'http://xtz.com')
    expect(grp).to_not be_valid
  end
end

describe 'associations' do
  it 'should have many group_times' do
    t = Group.reflect_on_association(:group_times)
    expect(t.macro).to eq(:has_many)
  end

  it 'should have many time_spents' do
    t = Group.reflect_on_association(:time_spents)
    expect(t.macro).to eq(:has_many)
  end
end
