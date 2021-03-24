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

  scenario 'All grades' do
    visit root_path
    click_on 'Log In'
    fill_in 'Name', with: 'user1'
    click_on 'Login'
    expect(current_path).to eql('/user')
    click_on 'All Grades'
    expect(current_path).to eql('/group')
    click_on 'Add Grade'
    expect(current_path).to eql('/group/new')
    fill_in 'Name', with: 'Grade-2'
    choose 'group_icon_fas_fa-address-book'
    click_on 'Submit'
    expect(current_path).to eql('/group')
    expect(page).to have_content 'Grade-2'
  end
end
