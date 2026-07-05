require "test_helper"

class Admin::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get admin_homes_admin_url
    assert_response :success
  end
end
