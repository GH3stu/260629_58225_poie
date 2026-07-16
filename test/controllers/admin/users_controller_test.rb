require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(
      email: "admin@example.com",
      password: "password"
    )

    post admin_login_path, params: {
      email_address: @admin.email,
      password: "password"
    }
    follow_redirect!

    @user = User.create!(
      name: "Test User",
      email: "test@example.com",
      password_digest: BCrypt::Password.create("password")
    )
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
