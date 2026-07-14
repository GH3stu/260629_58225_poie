require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(
      email: "admin@example.com",
      password: "password"
    )

    post admin_login_path, params: {
      email_address: @admin.email,
      password: "password"
    }

    # Create necessary fixtures programmatically
    @purpose = Purpose.create!(name: "テスト目的")
    @category = Category.create!(name: "テストカテゴリー", purpose_id: @purpose.id)
    @user = User.create!(
      name: "Test User",
      email: "test@example.com",
      password_digest: BCrypt::Password.create("password")
    )
    @post = Post.create!(
      title: "テスト投稿",
      body: "本文",
      user_id: @user.id,
      category_id: @category.id
    )
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
