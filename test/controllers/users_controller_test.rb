require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    post users_url, params: {
      user: {
        name: "Test User",
        email: "test_user@example.com",
        password: "password",
        password_confirmation: "password"
      }
    }
    assert_response :redirect
  end
end