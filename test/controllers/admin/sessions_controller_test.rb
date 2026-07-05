require "test_helper"

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_login_url
    assert_response :success
  end

  test "should get create" do
    post admin_login_url, params: {
      email: admins(:one).email_address,
      password: "password"
    }
    assert_response :redirect
    assert_redirected_to admin_posts_path
  end

  test "should get destroy" do
    delete admin_logout_url
    assert_response :redirect
    assert_redirected_to admin_login_url
  end
end

