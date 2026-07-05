require "test_helper"

class Admin::HomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(
      email_address: "admin@example.com",
      password: "password"
    )

    # 管理者ログイン状態を作る
    post admin_login_path, params: {
      email_address: @admin.email_address,
      password: "password"
    }
  end

  test "should get admin" do
    get admin_root_path
    assert_response :success
  end
end