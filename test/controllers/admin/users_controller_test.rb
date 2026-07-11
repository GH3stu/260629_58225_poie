require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(
      email_address: "admin@example.com",
      password: "password",
      password_confirmation: "password"
    )

    post admin_login_path, params: {
      email: @admin.email_address,
      password: "password"
    }
    follow_redirect!

    @user = users(:one)   # ← fixtures がある前提
  end

  test "should get index" do
    get admin_users_path
    assert_response :success
  end

  test "should get show" do
    get admin_user_path(@user)
    assert_response :success
  end
end
