class CategoryPostsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])

    if @category.name == "その他ポイント"
      @sub_categories = @category.sub_categories   # ここに追加
    else
      @posts = @category.posts.order(created_at: :desc)
    end
  end
end
