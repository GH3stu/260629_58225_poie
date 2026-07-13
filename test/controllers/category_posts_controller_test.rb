require "test_helper"

class CategoryPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get category_posts_path
    assert_response :success
  end
end
