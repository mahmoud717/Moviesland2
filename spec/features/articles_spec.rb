require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before :each do
    @user1 = User.create!(name: 'mahmoud', email: 'mahmoudmohammad717@gmail.com')
  end

  scenario 'User1  logs in and checks out articles on root path' do
    visit login_path
    fill_in 'Name', with: 'mahmoud'
    click_button 'Login'
    expect(page).to have_content('Copyright')
    click_link 'Logout'
  end
end
