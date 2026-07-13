require "test_helper"

class PurposeCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    purpose = Purpose.create!(name: "Test Purpose")
    get purpose_categories_path(purpose_id: purpose.id)
    assert_response :success
  end
end
