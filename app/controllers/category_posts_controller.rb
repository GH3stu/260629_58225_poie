class CategoryPostsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts.order(created_at: :desc)
  end
end
