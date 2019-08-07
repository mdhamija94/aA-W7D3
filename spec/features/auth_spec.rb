require 'rails_helper'
require 'spec_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', :with => "testing@email.com"
      fill_in 'password', :with => "biscuits"
      click_on "create user"
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content "testing@email.com"
    end

  end
end

feature 'logging in' do
  before(:each) do
    visit new_session_url
    test = User.create(username: "testing@email.com", password: "biscuits")
    fill_in 'username', :with => "testing@email.com"
    fill_in 'password', :with => "biscuits"
    click_on "Sign In"
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content "testing@email.com"
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
