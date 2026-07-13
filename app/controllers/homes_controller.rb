class HomesController < ApplicationController
  def top
  # 管理者投稿のみ取得
  @admin_posts = Post.where.not(admin_id: nil).order(created_at: :desc)
  end

  def about
  end
end
