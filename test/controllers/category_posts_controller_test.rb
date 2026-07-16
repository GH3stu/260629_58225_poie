require "test_helper"

class CategoryPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    category = Category.create!(name: "Test Category") 
    get category_posts_path(category_id: category.id)
    assert_response :success
  end
end
