class HomesController < ApplicationController
  def top
    if !logged_in?
      @admin_posts = Post.where.not(admin_id: nil).order(created_at: :desc)

  # ログイン時：ユーザー投稿はトップに表示しない（仕様どおり）
    else
      @admin_posts = Post.where.not(admin_id: nil).order(created_at: :desc)
    end

    @purposes = Purpose.all
  end

  def about
  end
end
