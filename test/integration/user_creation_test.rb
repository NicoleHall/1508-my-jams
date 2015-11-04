require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

test 'a user can be created' do
  visit new_user_path
  #save_and_open_page
  fill_in "Username", with: "Nicole"
  fill_in "Password", with: "password"

  click_button "Create Account"

  assert page.has_content?("Welcome, Nicole")
  end
end
