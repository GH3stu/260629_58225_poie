require "test_helper"

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_login_path
    assert_response :success
  end

  test "should get create" do
    post admin_login_path
    assert_response :redirect
  end

  test "should get destroy" do
    delete admin_logout_path
    assert_response :redirect
  end
end

