require "test_helper"

class PurposeCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purpose_categories_index_url
    assert_response :success
  end
end
