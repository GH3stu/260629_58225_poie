class HomesController < ApplicationController
  def top
    if !logged_in?
      @admin_posts = Post.where.not(admin_id: nil).order(created_at: :desc)
                               .page(params[:page]).per(5)

  # ログイン時：ユーザー投稿はトップに表示しない
    else
      @admin_posts = Post.where.not(admin_id: nil).order(created_at: :desc)
                         .page(params[:page]).per(5)
    end

    @purposes = Purpose.all
  end

  def about
  end
end
