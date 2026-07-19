class CategoryPostsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])

    if logged_in?
      # ログインユーザー：全投稿
      @posts = @category.posts.order(created_at: :desc)
    else
      # 非ログインユーザー：管理者投稿のみ
      @posts = @category.posts.where.not(admin_id: nil).order(created_at: :desc)
    end
  end
end
