require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # ★ create! を使わず、fixtures の admin を使う
    @admin = admins(:one)

    post admin_login_path, params: {
      email: @admin.email,
      password: "password"
    }

    # ★ follow_redirect! を削除（これが fixtures を壊していた）
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
