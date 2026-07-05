require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_posts_path
    assert_response :success
  end

  test "should get show" do
    post = posts(:one)
    get admin_post_path(post)
    assert_response :success
  end

  test "should get destroy" do
    post = posts(:one)
    delete admin_post_path(post)
    assert_response :redirect
  end
end

