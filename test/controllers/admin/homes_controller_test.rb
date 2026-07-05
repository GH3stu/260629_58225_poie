require "test_helper"

class Admin::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get admin_root_path
    assert_response :success
  end
end

