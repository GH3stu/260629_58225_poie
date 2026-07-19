require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      name: "Test User",
      email: "user@example.com",
      password: "password"
    )
  end

  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should get create" do
    post login_url, params: {
      email: @user.email,
      password: "password"
    }
    assert_response :redirect
    assert_redirected_to user_user_path(@user)
  end

  test "should get destroy" do
    delete logout_url
    assert_response :redirect
    assert_redirected_to root_url
  end
end
