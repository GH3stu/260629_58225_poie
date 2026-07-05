require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
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


