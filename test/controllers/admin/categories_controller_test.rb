require "test_helper"

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(email: "admin@example.com", password: "password")
    post admin_login_path, params: { email_address: @admin.email, password: "password" }
    follow_redirect!
  end

  test "should get index" do
    get admin_categories_path
    assert_response :success
  end

  test "should get new" do
    get new_admin_category_path
    assert_response :success
  end
end
