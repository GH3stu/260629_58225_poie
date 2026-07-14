require "test_helper"

class Admin::CommentsControllerTest < ActionDispatch::IntegrationTest
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

    # Create necessary fixtures programmatically
    @purpose = Purpose.create!(name: "テスト目的")
    @category = Category.create!(name: "テストカテゴリー", purpose_id: @purpose.id)
    @user = User.create!(
      name: "Test User",
      email: "test@example.com",
      password_digest: BCrypt::Password.create("password")
    )
    @post = Post.create!(
      title: "Test Post",
      body: "Test Body",
      user_id: @user.id,
      category_id: @category.id
    )
    @comment = Comment.create!(
      body: "Test Comment",
      user_id: @user.id,
      post_id: @post.id
    )
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
