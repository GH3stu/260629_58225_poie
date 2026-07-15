class SubCategoryPostsController < ApplicationController
  def index
    @sub_category = SubCategory.find(params[:sub_category_id])
    @posts = Post.where(sub_category_id: @sub_category.id).order(created_at: :desc)
  end
end
