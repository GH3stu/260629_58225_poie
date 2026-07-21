class PurposePostsController < ApplicationController
  def index
    @purpose = Purpose.find(params[:purpose_id])

    if logged_in?
      # ログイン後：すべての投稿を表示
      @posts = Post.where(purpose_id: @purpose.id).order(created_at: :desc)
    else
      # 非ログイン時：管理者投稿のみ表示
      @posts = Post.where(purpose_id: @purpose.id)
                   .where.not(admin_id: nil)
                   .order(created_at: :desc)
    end
  end
end

