require 'rails_helper'

RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

RSpec.feature 'Users' do
  before(:each) do
    @user = User.create(name: 'user1')
    @grp = @user.groups.build(name: 'Grade-1', Icon: 'far fa-address-card')
    @grp.save
    @ts = @user.time_spents.build(name: 'English', Amount: '120')
    @ts.save
    @ts2 = @user.time_spents.build(name: 'Planning', Amount: '120')
    @ts2.save
    @gt = GroupTime.create(time_spent_id: @ts.id, group_id: @grp.id)
  end

  scenario 'when a user clicks the Signin button' do
    visit root_path
    click_on 'Log In'
    fill_in 'Name', with: 'user1'
    click_on 'Login'
    expect(current_path).to eql('/user')
  end
end
