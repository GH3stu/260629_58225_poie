class CategoryPostsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])

    # その他ポイントの場合はサブカテゴリを取得
    if @category.name == "その他ポイント"
      @sub_categories = @category.sub_categories.order(:id)
    end

    if logged_in?
      @posts = @category.posts.order(created_at: :desc)
    else
      @posts = @category.posts.where.not(admin_id: nil).order(created_at: :desc)
    end
  end
end
