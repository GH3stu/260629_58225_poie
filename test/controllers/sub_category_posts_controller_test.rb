require "test_helper"

class SubCategoryPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sub_category_posts_index_url
    assert_response :success
  end
end
