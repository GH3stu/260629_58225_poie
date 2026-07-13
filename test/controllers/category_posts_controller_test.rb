require "test_helper"

class CategoryPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get category_category_posts_path(1)
    assert_response :success
  end
end
