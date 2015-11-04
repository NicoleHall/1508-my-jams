require "test_helper"

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'logged in admin sees categories index' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    assert page.has_content?("All Categories")
  end
end






























#
#
# test 'a logged in admin sees catgory index page' do
#   admin = User.create(username: "Andrew", password: "password", role: 1)
#
#   ApplicationController.any_instance.stubs(:current_user).returns(admin)
#
#   visit admin_categories_path
#   assert page.has_content?("All Categories")
#
# end
#
# test "logged in user does not see admin category index" do
#   skip
#   user = User.create(username: "Ross", password: "password", role: 0)
#   ApplicationController.any_instance.stubs(:current_user).returns(user)
#
#   visit admin_categories_path
#
#   refute page.has_content?("All Categories")
#   assert page.has_content?("The page you were looking for doesn't exist")
# end
