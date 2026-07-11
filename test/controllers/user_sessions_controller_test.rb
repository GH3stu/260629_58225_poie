require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should get create" do
    post login_url, params: {
      email: users(:one).email,
      password: "password"
    }
    assert_response :redirect
    assert_redirected_to user_user_path(users(:one))
  end

  test "should get destroy" do
    delete logout_url
    assert_response :redirect
    assert_redirected_to root_url
  end
end
