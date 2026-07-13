require "test_helper"

class CategoryPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    purpose = Purpose.create!(name: "Test Purpose")
    category = Category.create!(name: "Test Category", purpose_id: purpose.id) 
    get category_posts_path(category_id: category.id)
    assert_response :success
  end
end
