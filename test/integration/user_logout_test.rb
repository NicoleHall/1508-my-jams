require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  test 'a logged in user can logout' do
    user = User.create(username: "Nicole", password: "password")
    visit login_path

    fill_in "Username", with: "Nicole"
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Welcome, Nicole")

    click_link "Logout"

    refute page.has_content?("Welcome, Nicole")
  end
end
