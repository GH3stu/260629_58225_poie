require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
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

    @post = posts(:one)
  end

  test "should get index" do
    get admin_posts_path
    assert_response :success
  end

  test "should get show" do
    get admin_post_path(@post)
    assert_response :success
  end

  test "should get destroy" do
    delete admin_post_path(@post)
    assert_response :redirect
    assert_redirected_to admin_posts_path
  end
end
