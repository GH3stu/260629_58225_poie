require "test_helper"

class SubCategoryPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    # SubCategory は category に属するだけ
    category = Category.create!(name: "Test Category", purpose: Purpose.create!(name: "Test Purpose"))
    sub_category = SubCategory.create!(name: "Test SubCategory", category: category)

    get sub_category_posts_path(sub_category)
    assert_response :success
  end
end
