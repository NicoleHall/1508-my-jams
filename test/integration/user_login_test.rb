require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'a registered user can log in' do
    user = User.create(username: "Nicole", password: "password")

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"

    click_button "Login"

    assert page.has_content?("Welcome, Nicole")
  end

  test 'a registered user gets redirected when password is wrong' do
    user = User.create(username: "Nicole", password: "password")
    visit login_path

    fill_in "Username", with: "Nicole"
    fill_in "Password", with: "wrongpassword"

    click_button "Login"
    assert page.has_content?("Invalid Login")
  end

end
