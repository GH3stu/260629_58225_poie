require "test_helper"

class Admin::HomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(
      email_address: "admin@example.com",
      password: "password",
      password_confirmation: "password"
    )

    post admin_login_path, params: {
      email: @admin.email_address,   # ← email に修正
      password: "password"
    }

    follow_redirect!   # ← セッション維持に必須
  end

  test "should get admin" do
    get admin_root_path
    assert_response :success
  end
end
