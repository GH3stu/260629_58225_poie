require "test_helper"

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(
      email_address: "admin@example.com",
      password: "password"
    )
  end

  test "should get new" do
    get admin_login_url
    assert_response :success
  end

  test "should get create" do
    post admin_login_url, params: {
      email_address: @admin.email_address,
      password: "password"
    }
    assert_response :redirect
    assert_redirected_to admin_root_path
  end

  test "should get destroy" do
    # ログイン状態を作る
    post admin_login_url, params: {
      email_address: @admin.email_address,
      password: "password"
    }

    delete admin_logout_url
    assert_response :redirect
    assert_redirected_to admin_login_url
  end
end