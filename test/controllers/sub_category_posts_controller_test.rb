require "test_helper"

class SubCategoryPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    category = Category.create!(name: "Test Category")
    sub_category = SubCategory.create!(name: "Test SubCategory", category: category)

    get sub_category_posts_path(sub_category)
    assert_response :success
  end
end
