require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'a registered goes to their own show page' do
    user = User.create(username: "Nicole", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Welcome, #{user.username}")
    assert page.has_content?("#{user.username}'s Jams")

  end

  test 'once on show page, she can see the songs shes added' do
    user = User.create(username: "Nicole", password: "password")
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Welcome, #{user.username}")
    assert page.has_content?("#{user.username}'s Jams")
    tune = Song.create(title: "Hard Days Night", artist: "The Beatles")
    assert page.has_content?("#{user.songs}")
  end
end
