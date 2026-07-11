require "test_helper"

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
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
  end

  test "should get new" do
    get admin_login_url
    assert_response :success
  end

  test "should get create" do
    post admin_login_url, params: {
      email: @admin.email_address,   # ← email に統一
      password: "password"
    }
    assert_response :redirect
    assert_redirected_to admin_root_path
  end

  test "should get destroy" do
    post admin_login_url, params: {
      email: @admin.email_address,   # ← email に統一
      password: "password"
    }

    delete admin_logout_url
    assert_response :redirect
    assert_redirected_to admin_login_url
  end
end
