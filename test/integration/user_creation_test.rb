require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

test 'a user can be created' do
  visit new_user_path
  #save_and_open_page
  fill_in "Username", with: "Nicole"
  fill_in "Password", with: "password"

  # element = page.find("Username")
  # element.set(@user[:username])
  # element = page.find("Password")
  # element.set(@user[:password])
  click_button "Create Account"

  assert page.has_content?("Welcome, Nicole")
  end
end
