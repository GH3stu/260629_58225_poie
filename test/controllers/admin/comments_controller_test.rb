require "test_helper"

class Admin::CommentsControllerTest < ActionDispatch::IntegrationTest
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

    @comment = comments(:one)
  end

  test "should get index" do
    get admin_comments_path
    assert_response :success
  end

  test "should get show" do
    get admin_comment_path(@comment)
    assert_response :success
  end
end
